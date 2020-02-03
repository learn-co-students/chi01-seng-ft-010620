class CreateTasteTesters < ActiveRecord::Migration[6.0]
  def change
    create_table :taste_testers do |t|
      t.string :name
      t.integer :age

      t.timestamps
    end
  end
end
