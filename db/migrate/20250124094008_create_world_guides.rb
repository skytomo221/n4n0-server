class CreateWorldGuides < ActiveRecord::Migration[8.0]
  def change
    create_table :world_guides do |t|
      t.references :world, null: false, foreign_key: true
      t.string :description
      t.boolean :private
      t.datetime :released_at

      t.timestamps
    end
  end
end
