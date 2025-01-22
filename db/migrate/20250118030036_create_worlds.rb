class CreateWorlds < ActiveRecord::Migration[8.0]
  def change
    create_table :worlds do |t|
      t.string :vrchat_id
      t.string :name
      t.string :description
      t.datetime :released_at
      t.boolean :hidden

      t.timestamps
    end

    add_index :worlds, :vrchat_id, unique: true
  end
end
