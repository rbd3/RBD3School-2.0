class RenameClassIdtoInCoefficient < ActiveRecord::Migration[7.1]
  def change
    rename_column :subject_coefficients, :class_id, :class_assignment_id
  end
end
