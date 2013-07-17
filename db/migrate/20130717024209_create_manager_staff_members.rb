class CreateManagerStaffMembers < ActiveRecord::Migration
  def change
    create_table :manager_staff_members do |t|
      t.integer :manager_id
      t.integer :staff_member_id
      t.timestamps
    end
  end
end
