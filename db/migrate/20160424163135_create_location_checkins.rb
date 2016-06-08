class CreateLocationCheckins < ActiveRecord::Migration
  def change
    create_table :location_checkins do |t|
      t.integer :user_id
      t.integer :location_id
      t.float :lat
      t.float :long
      t.boolean :correct
      t.float :distance_from_correct
      t.timestamps null: false
    end
  end
end
