class ManagerStaffMember < ActiveRecord::Base
  attr_accessible :manager_id, :staff_member_id
  belongs_to :manager
  belongs_to :staff_member
end
