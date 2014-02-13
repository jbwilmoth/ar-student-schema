require_relative '../../db/config'  # => true

class Teacher < ActiveRecord::Base
  has_many :student                 # => #<ActiveRecord::Reflection::AssociationReflection:0x007f8f13df0b48 @macro=:has_many, @name=:student, @scope=nil, @options={}, @active_record=Teacher(no database connection), @plural_name="students", @collection=true>


  validates :email, uniqueness: true, format: { with: /.+@\w+\..{2,}/i, message: "must be a valid email address"}  # => {:uniqueness=>true, :format=>{:with=>/.+@\w+\..{2,}/i, :message=>"must be a valid email address"}}
  validate :phone_number_must_be_valid                                                                             # => [Teacher(no database connection)]

  def phone_number_must_be_valid
    if self.phone.scan(/[0-9]/).size <10 && (self.phone =~ /^[+\/\-() 0-9]+$/)
      errors.add(:phone, "number must have 10 digits")
    end
  end
end
