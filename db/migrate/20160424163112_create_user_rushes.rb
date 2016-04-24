class CreateUserRushes < ActiveRecord::Migration
  def change
    create_table :user_rushes do |t|
      t.integer :user_id
      t.integer :rush_id

      t.timestamps null: false
    end
  end
end
