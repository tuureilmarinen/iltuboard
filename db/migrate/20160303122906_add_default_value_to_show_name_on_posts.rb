class AddDefaultValueToShowNameOnPosts < ActiveRecord::Migration
	def change
		change_column_default :posts, :show_name, 0
	end
end
