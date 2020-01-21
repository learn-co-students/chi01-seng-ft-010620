class CreateTagAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :tag_assignments do |t|
      t.integer :tag_id
      t.integer :book_id
    end
  end
end
