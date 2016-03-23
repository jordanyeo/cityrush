class CreateClues < ActiveRecord::Migration
  def change
    create_table :clues do |t|
      t.string :name
      t.text :description
      t.string :latitude
      t.string :longitude
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
