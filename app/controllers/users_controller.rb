class UsersController < ApplicationController
	def index
		ensure_admin_or_user
		@users=User.all
	end

	def show
		@user = User.find(params[:id])
		@replied_topics = Topic.find_by_sql ["select distinct topics.* from topics join posts on posts.topic_id=topics.id where posts.user_id=? order by posts.created_at",@user.id]
		ensure_admin_or_user @user
	end
end
