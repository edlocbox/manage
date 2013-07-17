class SessionsController < ApplicationController
  def new
  end

  def create
    user = Manager.where(:email => params[:email].downcase).first || StaffMember.where(:email => params[:email].downcase).first
    if user.present?
      session[:current_user] = {:type => user.class, :email => user.email}
      if user.manager?
        redirect_to manager_path(user)
      else
        redirect_to staff_member_path(user)
      end
    else
      render :new, :error => "That employee cannot be found."
    end
  end
end