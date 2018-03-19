require 'Benchmark'
require_relative '../../02-algorithms/01-Introduction/fibonacci_iterative'
require_relative 'fibonnaci_recursive'

Benchmark.bm(10) do |x|
  x.report('iterative: ') {fib(35) }
  x.report('recursive: ') {fib_recursive(35)}
end
