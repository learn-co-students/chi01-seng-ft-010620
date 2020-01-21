class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :authors
      t.string :description

      t.timestamps
    end
  end
end
