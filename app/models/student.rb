require_relative '../../db/config'  # => true
require 'date'                      # => false

class Student < ActiveRecord::Base
  belongs_to :teacher               # => #<ActiveRecord::Reflection::AssociationReflection:0x007fe19169ee28 @macro=:belongs_to, @name=:teacher, @scope=nil, @options={}, @active_record=Student(no database connection), @plural_name="teachers", @collection=false>

  def name
    "#{first_name} #{last_name}"
  end

  def age
    now = Date.today
    now.year - self.birthday.year - ((now.month > self.birthday.month || (now.month == self.birthday.month && now.day >= self.birthday.day)) ? 0 : 1)
  end

  validates :email, uniqueness: true, format: { with: /.+@\w+\..{2,}/i, message: "must be a valid email address"}  # => {:uniqueness=>true, :format=>{:with=>/.+@\w+\..{2,}/i, :message=>"must be a valid email address"}}
  validates :age, numericality: {greater_than: 5}                                                                  # => {:numericality=>{:greater_than=>5}}
  validate :phone_number_must_be_valid                                                                             # => [Student(no database connection)]

  def phone_number_must_be_valid
    if self.phone.scan(/[0-9]/).size <10 && (self.phone =~ /^[+\/\-() 0-9]+$/)
      errors.add(:phone, "number must have 10 digits")
    end
  end
end

