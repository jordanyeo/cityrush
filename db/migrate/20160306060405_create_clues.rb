class CreateClues < ActiveRecord::Migration
  def change
    create_table :clues do |t|
      t.string :title
      t.text :description
      t.string :answer
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
