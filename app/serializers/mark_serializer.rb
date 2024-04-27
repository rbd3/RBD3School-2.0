class MarkSerializer < ActiveModel::Serializer
  attributes(*Mark.column_names)
end
