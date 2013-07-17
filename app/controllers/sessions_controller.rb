class SessionsController < ApplicationController
  skip_before_filter :require_user

  def new
    redirect_to user_path(current_user) if current_user
  end

  def create
    user = Manager.where(:email => params[:email].downcase).first || StaffMember.where(:email => params[:email].downcase).first
    if user.present?
      session[:current_user] = {:type => user.class, :email => user.email}
      redirect_to user_path(user)
    else
      flash.now[:error] = "That employee cannot be found."
      render :new
    end
  end

  def destroy
    session[:current_user] = nil
    redirect_to root_path, :success => 'You have been signed out.'
  end
end