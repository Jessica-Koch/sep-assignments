require 'Benchmark'

require_relative 'array'

arr = [46, 12, 15, 16, 36, 3, 40, 37, 11, 47, 22, 45, 20, 26, 7, 39, 28, 9, 34, 24, 8, 44, 48, 5, 29, 42, 4, 27, 33, 32, 35, 1, 14, 25, 19, 38, 13, 41, 2, 43, 49, 18, 21, 10, 30, 6, 50, 17, 31, 23]

Benchmark.bm(25) do |b|
  b.report('bubble_sort: ') do
    100_000.times do
      arr.bubble_sort
    end
  end
  b.report('bucket_sort: ') do
    100_000.times do
      arr.bucket_sort
    end
  end
  b.report('heap_sort: ') do
    100_000.times do
      arr.heap_sort
    end
  end
  b.report('insertion_sort: ') do
    100_000.times do
      arr.insertion_sort
    end
  end
  b.report('merge_sort: ') do
    100_000.times do
      arr.merge_sort
    end
  end
  b.report('quick_sort: ') do
    100_000.times do
      arr.quick_sort
    end
  end
  b.report('selection_sort: ') do
    100_000.times do
      arr.selection_sort
    end
  end
end
