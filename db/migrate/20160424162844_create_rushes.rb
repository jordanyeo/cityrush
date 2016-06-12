class CreateRushes < ActiveRecord::Migration
  def change
    create_table :rushes do |t|
      t.string :name
      t.text :description
      t.datetime :scheduled_at

      t.timestamps null: false
    end
  end
end
