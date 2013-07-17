class StaffMembersController < ApplicationController
  before_filter :require_manager, :only => :create
  before_filter :authorize_user, :only => [:edit, :update, :show]

  def show
  end

  def new
    @staff_member = StaffMember.new
  end

  def edit
  end

  def update
    if @staff_member.update_attributes(params[:staff_member])
      redirect_to user_path(current_user), :notice => "Staff member was successfully updated."
    else
      flash.now[:error] = @staff_member.errors.full_messages.join(", ")
      render :edit
    end
  end

  def create
    @staff_member = current_user.staff_members.create(params[:staff_member])

    if @staff_member.errors.none?
      redirect_to user_path(current_user)
    else
      flash.now[:error] = @staff_member.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def authorize_user
    @staff_member = StaffMember.where(:id => params[:id]).first
    unless @staff_member == current_user || current_user.manager?
      redirect_to user_path(current_user), :error => "You are not authorized to do that."
    end
  end
end