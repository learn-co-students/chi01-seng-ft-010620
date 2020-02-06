class CreateLoveNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :love_notes do |t|
      t.string :message

      t.timestamps
    end
  end
end
