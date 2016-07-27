class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :set_current_user

  def login_required
    if session[:user_id]
      return true
    else
      flash[:notice]="Please login to continue"
      session[:return_to]=request.url
      redirect_to :controller=>:welcomes,:action=>:new
      return false
    end
  end

  def current_user
    User.find session[:user_id] if session[:user_id]
  end
private
  def set_current_user
      User.current = current_user
    end
end
