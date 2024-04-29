class Student < ApplicationRecord
  belongs_to :class_assignment, optional: true
  belongs_to :user

  has_many :student_subjects
  has_many :subjects, through: :student_subjects

  has_many :marks

  def overall_mark
    total_mark = 0
    total_coefficient = 0

    marks.includes(:subject).each do |mark|
      coefficient = mark.subject.subject_coefficients.first&.coefficient
      total_mark += mark.mark_value * coefficient.to_i

      total_coefficient += coefficient.to_i
    end

    average = total_coefficient.zero? ? 0 : total_mark.to_f / total_coefficient

    { total_mark:, average: }
  end
end
