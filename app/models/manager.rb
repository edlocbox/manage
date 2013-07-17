class Manager < ActiveRecord::Base
  attr_accessible :name, :email, :phone_number
  has_many :manager_staff_members
  has_many :staff_members, :through => :manager_staff_members

  def user_hash
    {:type => "Manager", :email => email}
  end

  def manager?
    true
  end
end
