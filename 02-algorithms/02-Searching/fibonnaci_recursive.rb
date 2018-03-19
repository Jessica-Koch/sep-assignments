def fib_recursive(n)
  n <= 1 ? n : fib_recursive( n - 1) + fib_recursive(n - 2)
end
