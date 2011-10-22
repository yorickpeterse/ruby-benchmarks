require 'benchmark'
require File.expand_path('../user', __FILE__)

if ARGV[0]
  amount = ARGV[0].to_i
else
  amount = 100000
end

Benchmark.bmbm(40) do |run|
  run.report('Use instance_eval() and define_method()') do
    amount.times do
      u = User.new
      u.set_greeting
      u.greet
    end
  end

  run.report('Use an instance variable') do
    amount.times do
      u = UserAlt.new
      u.set_greeting
      u.greet
    end
  end
end
