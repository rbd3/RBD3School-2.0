class AddEmailToTeachers < ActiveRecord::Migration[7.1]
  def change
    add_column :teachers, :email, :string
  end
end
