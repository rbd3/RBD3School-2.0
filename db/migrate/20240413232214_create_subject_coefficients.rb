class CreateSubjectCoefficients < ActiveRecord::Migration[7.1]
  def change
    create_table :subject_coefficients do |t|
      t.references :subject, null: false, foreign_key: true
      t.string :class_name
      t.integer :coefficient

      t.timestamps
    end
  end
end
