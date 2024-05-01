class AddUserRefToStudents < ActiveRecord::Migration[7.1]
  def change
    add_reference :students, :user, foreign_key: true
  end
end
