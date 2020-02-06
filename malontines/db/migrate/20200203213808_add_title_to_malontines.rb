class AddTitleToMalontines < ActiveRecord::Migration[6.0]
  def change
    add_column :malontines, :title, :string
  end
end
