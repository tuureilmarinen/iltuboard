class AddLatestPostIdToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :latest_post_id, :integer
    add_foreign_key :topics, :posts, column: :latest_post_id
  end
end
