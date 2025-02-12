class CreatePortraits < ActiveRecord::Migration[8.0]
  def change
    create_table :portraits do |t|
      t.references :world, null: false, foreign_key: true
      t.references :photo, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.boolean :private
      t.datetime :released_at

      t.timestamps
    end
  end
end
