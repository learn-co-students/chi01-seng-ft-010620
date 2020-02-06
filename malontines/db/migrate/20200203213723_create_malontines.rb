class CreateMalontines < ActiveRecord::Migration[6.0]
  def change
    create_table :malontines do |t|
      t.references :creator, null: false, foreign_key: { to_table: :users }
      t.references :malone, null: false, foreign_key: true
      t.references :love_note, null: false, foreign_key: true

      t.timestamps
    end
  end
end
