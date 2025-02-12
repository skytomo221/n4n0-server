class CreatePhotos < ActiveRecord::Migration[8.0]
  def change
    create_table :photos do |t|
      t.string :description
      t.datetime :taken_at

      t.timestamps
    end
  end
end
