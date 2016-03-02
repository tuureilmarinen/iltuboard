class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :thread_id, null: false
      t.text :content, null: false
      t.integer :user_id
      t.integer :show_name, null: false
      t.string :author

      t.timestamps null: false
    end
    change_column_default :posts, :show_name, 0
  end
end
