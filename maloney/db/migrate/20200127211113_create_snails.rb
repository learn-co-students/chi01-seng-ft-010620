class CreateSnails < ActiveRecord::Migration
  def change
    create_table :snails do |t|
      t.string :name
      t.string :shell_color
      t.string :quote

      t.timestamps null: true
    end
  end
end
