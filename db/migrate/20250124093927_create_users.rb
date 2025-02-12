class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :vrchat_id
      t.string :name

      t.timestamps
    end
    add_index :users, :vrchat_id, unique: true
  end
end
