require 'benchmark'

amount = 1000000

# Run the benchmark
Benchmark.bmbm(20) do |run|
  run.report("Execute #{amount} fibers") do
    number = 0

    amount.times do
      fiber = Fiber.new do
        number += ( amount * 2 )
      end

      fiber.resume
    end
  end

  run.report("Execute #{amount} lambdas") do
    number = 0

    amount.times do
      lambd = lambda do
        number += ( amount * 2 )
      end

      lambd.call
    end
  end
end
