class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_user
    redirect_to login_path unless current_user
  end

  def current_user
    User.find_by_session(session[:current_user])
  end
end
