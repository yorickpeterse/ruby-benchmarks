class ObjectLiteral
  def initialize(hash)
    @hash = hash
  end

  def method_missing(method, *args, &block)
    method = @hash[method]

    if method.class == Proc
      return method.call(*args, &block)
    else
      return val
    end
  end

  def [](method)
    return @hash[method]
  end

  def []=(method, body)
    @hash[method] = body
  end
end
