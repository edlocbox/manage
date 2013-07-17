class ManagersController < ApplicationController
  before_filter :require_manager, :only => [:show]
  before_filter :authorize_user, :only => [:edit, :update]

  def edit
  end

  def update
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
    @manager = Manager.where(:id => params[:id]).first
    unless @manager == current_user || current_user.manager?
      redirect_to user_path(current_user), :error => "You are not authorized to do that."
    end
  end
end