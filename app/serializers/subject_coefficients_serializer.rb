class SubjectCoefficientsSerializer < ActiveModel::Serializer
  attributes(*SubjectCoefficients.column_names)
end
