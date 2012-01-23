require 'benchmark'

dummy_instance     = Struct.new(:name).new(nil)
instance_eval_proc = proc do
  @name = 'Foobar'
end

instance_eval_lambda = lambda do |instance|
  @name = 'Foobar'
end

if ARGV[0] and !ARGV[0].empty?
  amount = ARGV[0].to_i
else
  amount = 1000000
end

Benchmark.bmbm(30) do |bench|
  bench.report('Proc.new#call') do
    amount.times do
      Proc.new { 10+15 }.call
    end
  end

  bench.report('lambda#call') do
    amount.times do
      lambda { 10+15 }.call
    end
  end

  bench.report('instance_eval with Proc.new') do
    (amount * 10).times do
      dummy_instance.instance_eval(&instance_eval_proc)
    end
  end

  bench.report('instance_eval with lambda') do
    (amount * 10).times do
      dummy_instance.instance_eval(&instance_eval_lambda)
    end
  end
end
