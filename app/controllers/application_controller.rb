class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
  	@current_user ||= User.find_by(id: session[:user_id])
  end

  helper_method :current_user

  def visible_boards
    if admin?
      @visible_boards = Board.all
    else
      @visible_boards = Board.where(visible:true)
    end
  end
  helper_method :visible_boards

  def current_url(overwrite={})
    url_for :only_path => false, :params => params.merge(overwrite)
  end
  helper_method :current_url

  def admin?
    unless current_user.nil?
      current_user.admin?
    else
      false
    end
  end
  helper_method :admin?
end