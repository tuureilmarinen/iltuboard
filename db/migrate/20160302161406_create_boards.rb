class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :url
      t.string :name
      t.string :description
      t.boolean :nsfw
      t.boolean :visible

      t.timestamps null: false
    end
  end
end
