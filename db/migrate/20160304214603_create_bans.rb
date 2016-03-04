class CreateBans < ActiveRecord::Migration
  def change
    create_table :bans do |t|
      t.integer :user_id, null: false
      t.string :reason
      t.integer :post_id
      t.timestamp :ends_at, null: false

      t.timestamps null: false
    end
  end
end
