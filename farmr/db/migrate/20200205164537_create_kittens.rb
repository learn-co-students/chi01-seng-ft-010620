class CreateKittens < ActiveRecord::Migration[6.0]
  def change
    create_table :kittens do |t|
      t.string :name
      t.integer :age

      t.timestamps
    end
  end
end
