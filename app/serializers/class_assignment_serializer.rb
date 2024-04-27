class ClassAssignmentSerializer < ActiveModel::Serializer
  attributes(*ClassAssignment.column_names)
end
