class Subject < ApplicationRecord
  belongs_to :teacher
  has_many :subject_coefficients
end
