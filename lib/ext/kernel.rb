module Kernel

  # retrying code 'attempt' times with delay 'attempt' ** 2. If last attempt failed - returns nil.
  def try_to(attempt = 1, &block)
    begin
      yield
    rescue => exception
      if attempt < 5
        sleep(attempt ** 2)
        try_to(attempt + 1, &block)
      else
        Airbrake.notify(exception, error_message: "Exception from try_to block: #{exception.message}")
        return nil
      end
    end
  end

  # returns spent time in milliseconds
  def track_time(&block)
    start = Time.now
    yield block
    (Time.now - start).round(3) * 1000
  end

  # Is good for rake tasks, migrations etc.
  def each_with_progress(collection, sql_logging: false, batch: true)
    progress = 0

    all_count = collection.count
    puts_with_time "Found before: #{all_count} items."
    i = 0

    unless sql_logging
      old_logger = ActiveRecord::Base.logger
      ActiveRecord::Base.logger = nil
    end

    iterator_proc = Proc.new do |item|
      yield item, i

      current_progress = ((i * 100) / all_count.to_f).floor
      if current_progress > progress
        progress = current_progress
        puts_with_time "Done #{progress}%. #{i} of #{all_count} records."
      end

      i = i + 1
    end

    batch && collection.class.superclass.to_s == 'ActiveRecord::Relation' ?
        collection.find_each(batch_size: 1000) { |item| iterator_proc.call(item) } :
        collection.each { |item| iterator_proc.call(item) }

    unless sql_logging
      ActiveRecord::Base.logger = old_logger
    end

    puts_with_time "Left after: #{collection.count} items."

  rescue => e
    ActiveRecord::Base.logger = old_logger if old_logger
    raise e
  end

  def puts_with_time(string)
    puts "#{Time.now.utc.strftime('%F %T(%Z)')}. #{string}"
  end

end