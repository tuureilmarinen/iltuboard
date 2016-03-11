class CreatePostAttachments < ActiveRecord::Migration
  def change
    create_table :post_attachments do |t|
      t.integer :post_id
      t.integer :user_id
      t.string :file
      t.string :type

      t.timestamps null: false
    end
  end
end
