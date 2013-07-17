class Session
  attr_accessor :email, :type

  def initialize(session_hash)
    @email = session_hash[:email]
    @type = session_hash[:type]
  end
end