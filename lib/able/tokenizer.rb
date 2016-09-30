module Able::Tokenizer
  extend ActiveSupport::Concern

  # Todo DRY

  def generate_token(column = :token)
    if self.respond_to? column
      begin
        self[column] = SecureRandom.urlsafe_base64
      end while self.class.exists?(column => self[column])
    end
  end

  def generate_token!(column = :token)
    generate_token(column)
    save!
  end

  def generate_uuid(column = :uuid)
    if self.respond_to? column
      begin
        self[column] = SecureRandom.uuid
      end while self.class.exists?(column => self[column])
    end
  end

  def generate_uuid!(column = :uuid)
    generate_uuid(column)
    save!
  end

end