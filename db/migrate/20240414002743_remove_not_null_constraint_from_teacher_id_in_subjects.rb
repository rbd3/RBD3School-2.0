class RemoveNotNullConstraintFromTeacherIdInSubjects < ActiveRecord::Migration[7.1]
  def change
    remove_column :subjects, :teacher_id, :bigint, null: false
  end
end
