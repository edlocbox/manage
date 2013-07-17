class User < ActiveRecord::Base
  def self.find_by_session(session)
    session.type.constantize.where(:email => session.email).first
  end
end
