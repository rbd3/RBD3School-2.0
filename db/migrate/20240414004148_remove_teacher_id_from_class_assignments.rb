class RemoveTeacherIdFromClassAssignments < ActiveRecord::Migration[7.1]
  def change
    remove_column :class_assignments, :teacher_id, :bigint
  end
end
