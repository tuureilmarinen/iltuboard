class AddFirstPostIdToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :first_post_id, :integer
    add_foreign_key :topics, :posts, column: :first_post_id
  end
end
