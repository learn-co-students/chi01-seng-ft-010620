class AddSvgUrlAndNotePositionToMalones < ActiveRecord::Migration[6.0]
  def change
    add_column :malones, :svg_url, :string
    add_column :malones, :note_position, :string
  end
end
