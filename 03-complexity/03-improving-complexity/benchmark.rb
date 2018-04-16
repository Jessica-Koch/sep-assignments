require 'benchmark'
require_relative 'poorly_written_ruby'
require_relative 'improving_complexity_version_one'
require_relative 'improving_complexity_version_two'
require_relative 'improving_complexity_version_three'

arr1 = [*1..100].shuffle!
arr2 = [*1..100].shuffle!
arr3 = [*1..100].shuffle!

arr4 = [*1..500].shuffle!
arr5 = [*1..500].shuffle!
arr6 = [*1..500].shuffle!

arr7 = [*1..1000].shuffle!
arr8 = [*1..1000].shuffle!
arr9 = [*1..1000].shuffle!

arr10 = [*1..10000].shuffle!
arr11 = [*1..10000].shuffle!
arr12 = [*1..10000].shuffle!

arr13 = [*1..100000].shuffle!
arr14 = [*1..100000].shuffle!
arr15 = [*1..100000].shuffle!


Benchmark.bm(60) do |b|
  b.report('poorly_written_ruby 100 item array') { poorly_written_ruby(arr1, arr2, arr3)}
  b.report('poorly_written_ruby 500 item array') { poorly_written_ruby(arr4, arr5, arr6)}
  b.report('poorly_written_ruby 1,000 item array') { poorly_written_ruby(arr7, arr8, arr9)}
  b.report('poorly_written_ruby 10,000 item array') { poorly_written_ruby(arr10, arr11, arr12)}
  # b.report('poorly_written_ruby 100,000 item array') { poorly_written_ruby(arr13, arr14, arr15)}

  b.report('better_ruby 100 item array') { better_ruby(arr1, arr2, arr3)}
  b.report('better_ruby 500 item array') { better_ruby(arr4, arr5, arr6)}
  b.report('better_ruby 1,000 item array') { better_ruby(arr7, arr8, arr9)}
  b.report('better_ruby 10,000 item array') { better_ruby(arr10, arr11, arr12)}
  # b.report('better_ruby 100,000 item array') { better_ruby(arr13, arr14, arr15)}

  b.report('improved_algorithm 100 item array') { improved_algorithm(arr1, arr2, arr3)}
  b.report('improved_algorithm 500 item array') { improved_algorithm(arr4, arr5, arr6)}
  b.report('improved_algorithm 1,000 item array') { improved_algorithm(arr7, arr8, arr9)}
  b.report('improved_algorithm 10,000 item array') { improved_algorithm(arr10, arr11, arr12)}
  b.report('improved_algorithm 100,000 item array') { improved_algorithm(arr13, arr14, arr15)}

  b.report('time_for_space 100 item array') { time_for_space(arr1, arr2, arr3)}
  b.report('time_for_space 500 item array') { time_for_space(arr4, arr5, arr6)}
  b.report('time_for_space 1,000 item array') { time_for_space(arr7, arr8, arr9)}
  b.report('time_for_space 10,000 item array') { time_for_space(arr10, arr11, arr12)}
  b.report('time_for_space 100,000 item array') { time_for_space(arr13, arr14, arr15)}
end
