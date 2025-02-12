class CreatePortraitSubjects < ActiveRecord::Migration[8.0]
  def change
    create_table :portrait_subjects do |t|
      t.references :portrait, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
