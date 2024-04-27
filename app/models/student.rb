class Student < ApplicationRecord
  belongs_to :class_assignment, optional: true

  has_many :student_subjects
  has_many :subjects, through: :student_subjects
end
