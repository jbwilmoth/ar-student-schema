require_relative '../config'

class AddNameStudent < ActiveRecord::Migration
  def change
  	add_column :students, :name, :string

  end
end