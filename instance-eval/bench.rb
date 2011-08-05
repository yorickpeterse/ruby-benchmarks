require 'benchmark'
require File.expand_path('../plugin', __FILE__)

if ARGV[0]
  amount = ARGV[0].to_i
else
  amount = 100000
end

results = Benchmark.bmbm(40) do |run|
  # Use Plugin#instance_eval()
  run.report("Plugin#add, #{amount} iterations") do
    amount.times do
      Plugin.add(:users) do
        author 'Yorick Peterse'
      end
    end
  end

  # Use yield
  run.report("Plugin#add_yield, #{amount} iterations") do
    amount.times do
      Plugin.add_yield(:users) do |plugin|
        plugin.author 'Yorick Peterse'
      end
    end
  end
end

diff = results[0].real / results[1].real

puts "
In plain English, yield() is %.2f times faster than instance_eval()" \
  % diff
