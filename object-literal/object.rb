class User
  def login(username, password)
    @username, @password = username, password
  end

  def username
    return @username
  end

  def password
    return @password
  end
end
