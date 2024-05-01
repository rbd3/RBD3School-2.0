class AddMatriculeToStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :matricule, :string
  end
end
