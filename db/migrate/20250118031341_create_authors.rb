class CreateAuthors < ActiveRecord::Migration[8.0]
  def change
    create_table :authors do |t|
      t.string :vrchat_id
      t.string :name

      t.timestamps
    end

    add_index :authors, :vrchat_id, unique: true
  end
end
