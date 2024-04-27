class ClassAssignment < ApplicationRecord
  has_many :class_teachers
  has_many :teachers, through: :class_teachers
end
