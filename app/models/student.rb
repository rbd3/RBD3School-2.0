class Student < ApplicationRecord
  belongs_to :class_assignment, optional: true
end
