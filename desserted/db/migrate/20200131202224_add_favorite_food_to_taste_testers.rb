class AddFavoriteFoodToTasteTesters < ActiveRecord::Migration[6.0]
  def change
    add_column :taste_testers, :favorite_food, :string
  end
end
