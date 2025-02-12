class CreateWorldGuidePhotos < ActiveRecord::Migration[8.0]
  def change
    create_table :world_guide_photos do |t|
      t.references :world_guide, null: false, foreign_key: true
      t.references :photo, null: false, foreign_key: true
      t.integer :display_order

      t.timestamps
    end
  end
end
