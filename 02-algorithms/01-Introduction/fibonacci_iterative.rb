def fib(n)
  fib_0 = 0
  fib_1 = 1

  n.times do |i|
    temp = fib_0
    fib_0 = fib_1
    fib_1 = temp + fib_1

  end
  return fib_0
end

puts "#{0}'s fibonacci value is #{fib(0)}"
puts "#{1}'s fibonacci value is #{fib(1)}"
puts "#{2}'s fibonacci value is #{fib(2)}"
puts "#{3}'s fibonacci value is #{fib(3)}"
puts "#{4}'s fibonacci value is #{fib(4)}"
puts "#{5}'s fibonacci value is #{fib(5)}"
puts "#{6}'s fibonacci value is #{fib(6)}"
puts "#{7}'s fibonacci value is #{fib(7)}"
puts "#{8}'s fibonacci value is #{fib(8)}"
puts "#{9}'s fibonacci value is #{fib(9)}"
