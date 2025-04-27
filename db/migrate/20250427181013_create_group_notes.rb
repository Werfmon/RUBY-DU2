class CreateGroupNotes < ActiveRecord::Migration[8.0]
  def change
    create_table :group_notes do |t|
      t.references :group, null: false, foreign_key: true
      t.references :note, null: false, foreign_key: true

      t.timestamps
    end
  end
end
