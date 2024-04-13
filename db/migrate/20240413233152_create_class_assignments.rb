class CreateClassAssignments < ActiveRecord::Migration[7.1]
  def change
    create_table :class_assignments do |t|
      t.references :teacher, null: false, foreign_key: true
      t.string :class_name

      t.timestamps
    end
  end
end
