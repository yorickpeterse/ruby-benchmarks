require 'benchmark'
require File.expand_path('../object_literal', __FILE__)
require File.expand_path('../object'        , __FILE__)

amount = 1000000

Benchmark.bmbm(20) do |bench|

  bench.report("Object literal, 1 million iterations") do
    amount.times do
      u = ObjectLiteral.new(
        :login => Proc.new do |username, password|
          @username, @password = username, password
        end,
        :username => lambda do
          return @username
        end,
        :password => lambda do
          return @password
        end
      )

      u.login('yorick', 'yorick')
      u.username
      u.password
    end
  end

  bench.report("Regular object, 1 million iterations") do
    amount.times do
      u = User.new

      u.login('yorick', 'yorick')
      u.username
      u.password
    end
  end

end
