class AddUserRefToTeachers < ActiveRecord::Migration[7.1]
  def change
    add_reference :teachers, :user, foreign_key: true
  end
end
