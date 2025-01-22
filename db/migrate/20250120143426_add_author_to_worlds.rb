class AddAuthorToWorlds < ActiveRecord::Migration[8.0]
  def change
    add_reference :worlds, :author, null: false, foreign_key: true
  end
end
