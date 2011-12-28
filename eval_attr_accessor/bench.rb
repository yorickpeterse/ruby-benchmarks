require 'benchmark'

class Dummy; end

if ARGV[0]
  amount = ARGV[0].to_i
else
  amount = 100000
end

Benchmark.bmbm(40) do |b|
  b.report('eval()') do
    amount.times do
      Dummy.class_eval('def foo; 10; end')
    end
  end

  b.report('attr_accessor()') do
    amount.times do
      Dummy.send(:attr_accessor, :foo)
    end
  end
end
