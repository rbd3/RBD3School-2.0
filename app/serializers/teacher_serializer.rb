class TeacherSerializer < ActiveModel::Serializer
  attributes(*Teacher.column_names)
end
