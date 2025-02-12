class CreatePortraitTags < ActiveRecord::Migration[8.0]
  def change
    create_table :portrait_tags do |t|
      t.references :portrait, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
