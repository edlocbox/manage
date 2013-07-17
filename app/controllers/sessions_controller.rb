class SessionsController < ApplicationController
  skip_before_filter :require_user

  def new
    redirect_to dashboard_path(current_user) if current_user
  end

  def create
    user = Manager.where(:email => params[:email].downcase).first || StaffMember.where(:email => params[:email].downcase).first
    if user.present?
      session[:current_user] = {:type => user.class, :email => user.email}
      redirect_to dashboard_path(user)
    else
      render :new, :error => "That employee cannot be found."
    end
  end

  def destroy
    session[:current_user] = nil
    redirect_to root_path, :success => 'You have been signed out.'
  end

  private

  def dashboard_path(user)
    user.manager? ? manager_path(user) : staff_member_path(user)
  end
end