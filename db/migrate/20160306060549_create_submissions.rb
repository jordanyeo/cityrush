class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :guess
      t.integer :event_id
      t.integer :user_id
      t.integer :clue_id
      t.boolean :correct

      t.timestamps null: false
    end
  end
end
