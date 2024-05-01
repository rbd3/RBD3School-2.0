class TeachingAssignment < ApplicationRecord
  belongs_to :teacher
  belongs_to :subject
  belongs_to :class_assignment
end
