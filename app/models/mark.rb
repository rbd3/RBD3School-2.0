class Mark < ApplicationRecord
  belongs_to :student
  belongs_to :subject
  belongs_to :class_assignment

  validates :mark_value, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
end
