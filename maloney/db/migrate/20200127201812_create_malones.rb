class CreateMalones < ActiveRecord::Migration
  def change
    create_table :malones do |t|
      t.string :title
      t.string :image_url
      t.string :description
      t.integer :upvotes, default: 0

      t.timestamps
    end
  end
end
