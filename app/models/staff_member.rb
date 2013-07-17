class StaffMember < ActiveRecord::Base
  attr_accessible :name, :email, :phone_number
  has_many :manager_staff_members
  has_many :managers, :through => :manager_staff_members

  def user_hash
    {:type => "StaffMember", :email => email}
  end

  def manager?
    false
  end
end