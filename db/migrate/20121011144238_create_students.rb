require_relative '../config'

class CreateStudents < ActiveRecord::Migration
  def change
    create_table   :students do |t|
      t.string     :first_name
      t.string     :last_name
      t.string     :gender
      t.string     :email
      t.string     :phone
      t.string     :address
      t.date       :birthday
      t.timestamps
    end
  end
end
