class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :firts_name
      t.string :last_name
      t.string :email
      t.string :role

      t.timestamps
    end
  end
end
