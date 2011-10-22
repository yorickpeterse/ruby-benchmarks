require 'benchmark'

if ARGV[0] and !ARGV[0].empty?
  amount = ARGV[0].to_i
else
  amount = 1000000
end

Benchmark.bmbm(20) do |bench|
  bench.report('Proc.new') do
    amount.times do
      Proc.new { 10+15 }.call
    end
  end

  bench.report('lambda') do
    amount.times do
      lambda { 10+15 }.call
    end
  end
end
