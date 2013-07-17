class User < ActiveRecord::Base
  def self.find_by_session(session)
    session.type.where(:email => session.email).first
  end
end
