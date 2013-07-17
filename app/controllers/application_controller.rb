class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_user

  def require_user
    redirect_to login_path unless current_user
  end

  def session_hash
    session[:current_user]
  end

  def current_user
    if session_hash
      @current_user ||= User.find_by_session(Session.new(session_hash))
    else
      nil
    end
  end
end
