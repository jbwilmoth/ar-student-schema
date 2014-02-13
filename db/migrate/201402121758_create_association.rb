require_relative '../config'

class CreateAssociation < ActiveRecord::Migration
  def change
  	create_table :enrollments do |t|
  	  t.belongs_to :student
  	  t.belongs_to :teacher

  	  t.timestamps
  	end
  end
end