class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.integer :board_id, null: false

      t.timestamps null: false
    end
  end
end
