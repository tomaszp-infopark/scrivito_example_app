class User

  def initialize(username)
    @username = username
  end

  attr_reader :username

  def display_name
    username
  end

  def self.from_session(session)
    if username = session[:username]
      new(username)
    end
  end

  def add_to_session(session)
    session[:username] = username
  end

  def self.clear_session(session)
    session.delete(:username)
  end

end
