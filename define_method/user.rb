class User
  def set_greeting
    metaclass = class << self; self; end
    metaclass.instance_eval do
      define_method(:greet) do
        return 'Hello world'
      end
    end
  end

  def greet
    'Hello Ruby'
  end
end

class UserAlt
  def set_greeting
    @greeting = 'Hello world'
  end

  def greet
    return @greeting || 'Hello Ruby'
  end
end
