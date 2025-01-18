class CreatePhotos < ActiveRecord::Migration[8.0]
  def change
    create_table :photos do |t|
      t.references :world, null: false, foreign_key: true
      t.integer :display_order
      t.string :description

      t.timestamps
    end
  end
end
