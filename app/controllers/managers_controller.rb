class ManagersController < ApplicationController
  before_filter :authorize_user, :only => [:edit, :update]

  def edit
    @manager = Manager.where(:id => params[:id]).first
  end

  def update
    @manager = Manager.where(:id => params[:id]).first

    if @manager.update_attributes(params[:manager])
      redirect_to user_path(current_user), :notice => "Manager was successfully updated."
    else
      flash.now[:error] = @manager.errors.full_messages.join(", ")
      render :edit
    end
  end

  def show
  end

  private

  def authorize_user
    redirect_to user_path(current_user) unless @manager == current_user || current_user.manager?
  end
end