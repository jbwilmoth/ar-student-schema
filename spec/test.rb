require_relative '../app/models/teacher'
require_relative '../app/models/student'
require 'date'


student = Student.new(name: "Joe Wilmoth",gender: "male", email: "joe@schmo.com", birthday: "1984-07-09", phone: "1234567890", address: "123 Bull Drive.")

student.save

p Student.where("first_name = ?", "Joe")

# teacher = Teacher.new(name: "Albert Pujols", email: "albert@pujols.com", phone: "353-642-6234")

# teacher.save
students = Student.all
# Teacher.all.each do |teacher|

#   (students.length/Teacher.count).times

# end

