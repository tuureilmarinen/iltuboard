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

  def is_user(u)
    return false if current_user.nil?
    if u.class.name=="User" and current_user.id==u.id
      return current_user
    elsif u.class.name=="Fixnum" and u==current_user.id
      return current_user
    else
      return false
    end
  end
  helper_method :is_user

  def ensure_admin_or_user(u=nil)
    if is_user(u) or admin?
      return true
    else
      redirect_to root_url, alert: "You need to be admin or #{u.to_s}!"
    end
  end
  helper_method :ensure_admin_or_user

  def precentage (numerator,denominator)
    if numerator==0 or denominator==0
      #return Float::NAN
      return 0
    end
    ((numerator/denominator.to_f)*100).to_i
  end
  helper_method :precentage

end