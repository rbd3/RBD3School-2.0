class StudentSerializer < ActiveModel::Serializer
  attributes(*Student.column_names)
end
