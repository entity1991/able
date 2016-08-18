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
  def each_with_progress(collection)
    progress = 0

    all_count = collection.count
    puts_with_time "Found before: #{all_count} items."
    i = 0

    collection.find_each(batch_size: 1000) do |item|
      yield item

      i = i + 1

      current_progress = ((i * 100) / all_count.to_f).floor
      if current_progress > progress
        progress = current_progress
        puts_with_time "Done #{progress}%. #{i} of #{all_count} records."
      end

    end

    puts_with_time "Left after: #{collection.count} items."
  end

  def puts_with_time(string)
    puts "#{Time.now.utc.strftime('%F %T(%Z)')}. #{string}"
  end

end