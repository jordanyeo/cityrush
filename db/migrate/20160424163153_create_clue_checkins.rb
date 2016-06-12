class CreateClueCheckins < ActiveRecord::Migration
  def change
    create_table :clue_checkins do |t|
      t.integer :user_id
      t.integer :clue_id
      t.float :lat
      t.float :long
      t.boolean :correct
      t.float :distance_from_correct
      t.timestamps null: false
    end
  end
end
