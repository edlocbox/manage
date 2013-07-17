class Manager < ActiveRecord::Base
  attr_accessible :name, :email, :phone_number
  has_many :manager_staff_members
  has_many :staff_members, :through => :manager_staff_members

  validates_presence_of :email, :name, :phone_number

  validates_uniqueness_of :email
  validates_uniqueness_of :phone_number
  validates_length_of :phone_number, :is => 10

  before_validation :clean_phone

  def user_hash
    {:type => "Manager", :email => email}
  end

  def manager?
    true
  end

  private

  def clean_phone
    self.phone_number = phone_number.gsub(/[^0-9]/, '')
  end
end
