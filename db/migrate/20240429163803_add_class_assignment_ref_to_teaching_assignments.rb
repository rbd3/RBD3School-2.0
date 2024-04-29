class AddClassAssignmentRefToTeachingAssignments < ActiveRecord::Migration[7.1]
  def change
    add_reference :teaching_assignments, :class_assignment, foreign_key: true
  end
end
