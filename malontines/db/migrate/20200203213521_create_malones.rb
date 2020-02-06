class CreateMalones < ActiveRecord::Migration[6.0]
  def change
    create_table :malones do |t|
      t.string :name
      t.string :image_url
      t.string :description

      t.timestamps
    end
  end
end
