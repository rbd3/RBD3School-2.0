class CreateClassTeachersJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_table :class_teachers do |t|
      t.belongs_to :class_assignment
      t.belongs_to :teacher
      t.timestamps
    end
  end
end
