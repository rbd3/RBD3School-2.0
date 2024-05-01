class RemoveClassNameFromSubjectCoefficients < ActiveRecord::Migration[7.1]
  def change
    remove_column :subject_coefficients, :class_name
  end
end
