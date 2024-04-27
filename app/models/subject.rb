class Subject < ApplicationRecord
  has_many :subject_coefficients

  has_many :student_subjects, dependent: :destroy
  has_many :students, through: :student_subjects
end
