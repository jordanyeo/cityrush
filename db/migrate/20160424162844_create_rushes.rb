class CreateRushes < ActiveRecord::Migration
  def change
    create_table :rushes do |t|
      t.string :name
      t.time :scheduled_at

      t.timestamps null: false
    end
  end
end
