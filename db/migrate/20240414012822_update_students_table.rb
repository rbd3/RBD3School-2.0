class UpdateStudentsTable < ActiveRecord::Migration[7.1]
  def change
    change_column :students, :class_assignment_id, :bigint, null: true
  end
end
