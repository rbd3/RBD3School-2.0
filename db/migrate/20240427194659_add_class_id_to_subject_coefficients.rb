class AddClassIdToSubjectCoefficients < ActiveRecord::Migration[7.1]
  def change
    add_column :subject_coefficients, :class_id, :bigint
    add_index :subject_coefficients, :class_id
  end
end
