require_relative '../../db/config'
require 'date'                     

class Student < ActiveRecord::Base
has_and_belongs_to_many :teachers

  validates :email, uniqueness: true, format: { with: /.+@\w+\..{2,}/i, message: "must be a valid email address"}
  validates :age, numericality: {greater_than: 5}                                                                  
  validate :phone_number_must_be_valid 

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def age
    now = Date.today
    now.year - self.birthday.year - ((now.month > self.birthday.month || (now.month == self.birthday.month && now.day >= self.birthday.day)) ? 0 : 1)
  end

  validates :email, uniqueness: true, format: { with: /.+@\w+\..{2,}/i, message: "must be a valid email address"}
  validates :age, numericality: {greater_than: 5}                                                                  
  validate :phone_number_must_be_valid                                                                             

  def phone_number_must_be_valid
    if self.phone.scan(/[0-9]/).size <10 && (self.phone =~ /^[+\/\-() 0-9]+$/)
      errors.add(:phone, "number must have 10 digits")
    end
  end
end

