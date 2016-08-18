module Able::Emailable
  extend ActiveSupport::Concern

  def email=(value)
    write_attribute :email, value.try(:downcase) # ignore nil value
  end

  included do
    def self.find_by_email(email)
      self.where(email: email.downcase).first
    end
  end

end