class AddClassAssignmentRefToMarks < ActiveRecord::Migration[7.1]
  def change
    add_reference :marks, :class_assignment, foreign_key: true, default: 2
  end
end
