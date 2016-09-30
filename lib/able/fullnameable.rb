module Able::Fullnameable
  extend ActiveSupport::Concern

  def full_name
    "#{first_name} #{last_name}".split(' ').map(&:capitalize).join(' ')
  end

  def to_s
    full_name
  end

end