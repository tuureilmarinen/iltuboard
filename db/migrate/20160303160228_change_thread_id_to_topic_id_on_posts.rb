class ChangeThreadIdToTopicIdOnPosts < ActiveRecord::Migration
  def change
  	rename_column :posts, :thread_id, :topic_id
  end
end
