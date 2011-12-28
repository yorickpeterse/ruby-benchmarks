require 'benchmark'

class Dummy
  def self.use_eval
    self.class_eval('def foo; @foo; end; def foo=(f); @foo = f; end')
  end

  def self.use_attr_accessor
    (class << self; self; end).send(:attr_accessor, :foo)
  end
end

if ARGV[0]
  amount = ARGV[0].to_i
else
  amount = 100000
end

Benchmark.bmbm(40) do |b|
  b.report('eval()') do
    amount.times do
      Dummy.use_eval

      d = Dummy.new
      d.foo = 10
      d.foo
    end
  end

  b.report('attr_accessor()') do
    amount.times do
      Dummy.use_attr_accessor

      d = Dummy.new
      d.foo = 10
      d.foo
    end
  end
end
