class CreateDesserts < ActiveRecord::Migration[6.0]
  def change
    create_table :desserts do |t|
      t.string :name
      t.boolean :gluteny
      t.integer :tastiness
      t.timestamps
    end
  end
end
