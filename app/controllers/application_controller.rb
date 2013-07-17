class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_user

  private

  def require_user
    redirect_to login_path unless current_user
  end

  def require_manager
    redirect_to user_path(current_user) unless current_user.manager?
  end

  def session_hash
    session[:current_user]
  end

  def user_path(user)
    user.manager? ? manager_path(user) : staff_member_path(user)
  end

  def edit_user_path(user)
    user.manager? ? edit_manager_path(user) : edit_staff_member_path(user)
  end
  helper_method :edit_user_path

  def current_user
    if session_hash
      @current_user ||= User.find_by_session(Session.new(session_hash))
    else
      nil
    end
  end
end
