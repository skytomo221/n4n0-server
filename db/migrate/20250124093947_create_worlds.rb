class CreateWorlds < ActiveRecord::Migration[8.0]
  def change
    create_table :worlds do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.string :name
      t.string :vrchat_id

      t.timestamps
    end
    add_index :worlds, :vrchat_id, unique: true
  end
end
