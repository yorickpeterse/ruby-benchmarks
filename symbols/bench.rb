require 'benchmark'
require File.expand_path('../generate', __FILE__)

if ARGV[0]
  amount = ARGV[0].to_i
else
  amount = 100000
end

Benchmark.bmbm(20) do |bench|
  bench.report('Random symbols') do
    amount.times do
      random_string.to_sym
    end
  end

  bench.report('Random strings') do
    amount.times do
      random_string
    end
  end
end
