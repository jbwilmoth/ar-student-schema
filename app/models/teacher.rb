require_relative '../../db/config'

class Teacher < ActiveRecord::Base
  has_and_belongs_to_many :students

  validates :email, uniqueness: true, format: { with: /.+@\w+\..{2,}/i, message: "must be a valid email address"}
  validate :phone_number_must_be_valid                                                                             

  def phone_number_must_be_valid
    if self.phone.scan(/[0-9]/).size <10 && (self.phone =~ /^[+\/\-() 0-9]+$/)
      errors.add(:phone, "number must have 10 digits")
    end
  end
end
