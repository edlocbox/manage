# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ed = Manager.create(:name => "Edward Weng", :email => "edweng@gmail.com", :phone_number => "5862914303")
sailesh = Manager.create(:name => "Sailesh Ramakrishnan", :email => "sailesh@locbox.com", :phone_number => "3138675309")

ed.staff_members << StaffMember.create(:name => "Staff Member 1", :email => "employee1@gmail.com", :phone_number => "1234567890")
ed.staff_members << StaffMember.create(:name => "Staff Member 2", :email => "employee2@gmail.com", :phone_number => "1234567891")
sailesh.staff_members << StaffMember.create(:name => "Staff Member 3", :email => "employee3@gmail.com", :phone_number => "1234567892")
sailesh.staff_members << StaffMember.create(:name => "Staff Member 4", :email => "employee4@gmail.com", :phone_number => "1234567893")
