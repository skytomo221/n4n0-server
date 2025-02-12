class CreateWorldGuideTags < ActiveRecord::Migration[8.0]
  def change
    create_table :world_guide_tags do |t|
      t.references :world_guide, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
