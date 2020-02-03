class CreateCohorts < ActiveRecord::Migration[5.1]
  def change
    create_table :cohorts do |t|
      t.string :name

      t.timestamps
    end
  end
end
