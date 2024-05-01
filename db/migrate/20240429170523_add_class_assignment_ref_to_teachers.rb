class AddClassAssignmentRefToTeachers < ActiveRecord::Migration[7.1]
  def change
    add_reference :teachers, :class_assignment, foreign_key: true
  end
end
