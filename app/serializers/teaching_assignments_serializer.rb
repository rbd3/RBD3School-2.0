class TeachingAssignmentsSerializer < ActiveModel::Serializer
  attributes(*TeacherAssignment.column_names)
end
