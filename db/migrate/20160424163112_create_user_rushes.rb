class CreateUserRushes < ActiveRecord::Migration
  def change
    create_table :user_rushes do |t|
      t.integer :user_id
      t.integer :rush_id
      t.float :lat
      t.float :long
      t.integer :active_location, :default => 1
      t.datetime :checked_in_at
      t.boolean :complete
      t.timestamps null: false
    end
  end
end
