class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :rush_id
      t.string :name
      t.text :description
      t.float :lat
      t.float :long

      t.timestamps null: false
    end
  end
end
