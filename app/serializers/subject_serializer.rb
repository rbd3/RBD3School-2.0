class SubjectSerializer < ActiveModel::Serializer
  attributes *Subject.column_names
end
