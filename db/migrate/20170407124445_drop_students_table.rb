class DropStudentsTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :students
  end
end
