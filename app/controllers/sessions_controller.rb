class SessionsController < ApplicationController
	def create
		begin
			@user = User.from_omniauth(request.env['omniauth.auth'])
			session[:user_id] = @user.id
			flash[:success] = "Welcome, #{@user.name}!"
		rescue
			flash[:warning] = "There was an error while trying to authenticate you..."
		end
		if @user
			redirect_to @user
		else
			redirect_to root_path
		end
	end
	def destroy
		if current_user
			session.delete(:user_id)
			flash[:success] = 'Adieu!'
		end
		redirect_to root_path
	end
end