class Teacher < ApplicationRecord
  has_many :teaching_assignments
  has_many :subjects_taught, through: :teaching_assignments, source: :subject

  has_many :class_assignments
  has_many :classes_taught, through: :class_assignments, source: :class_name
end
