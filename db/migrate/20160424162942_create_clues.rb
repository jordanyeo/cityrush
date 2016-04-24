class CreateClues < ActiveRecord::Migration
  def change
    create_table :clues do |t|
      t.integer :location_id
      t.text :description
      t.float :lat
      t.float :long

      t.timestamps null: false
    end
  end
end
