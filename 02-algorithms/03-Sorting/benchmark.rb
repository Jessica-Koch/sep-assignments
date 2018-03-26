require 'Benchmark'

require_relative 'insertion_sort'
require_relative 'selection_sort'
require_relative 'bubble_sort'
require_relative 'merge_sort'
require_relative 'quick_sort'
require_relative 'bucket_sort'
require_relative 'heap_sort'
require_relative 'quick_sort'

arr = [46, 12, 15, 16, 36, 3, 40, 37, 11, 47, 22, 45, 20, 26, 7, 39, 28, 9, 34, 24, 8, 44, 48, 5, 29, 42, 4, 27, 33, 32, 35, 1, 14, 25, 19, 38, 13, 41, 2, 43, 49, 18, 21, 10, 30, 6, 50, 17, 31, 23]

Benchmark.bm(25) do |b|
  b.report('insertion_sort: ') do
    100_000.times do
      insertion_sort(arr)
    end
  end
  b.report('selection_sort: ') do
    100_000.times do
      selection_sort(arr)
    end
  end
  b.report('bubble_sort: ') do
    100_000.times do
      bubble_sort(arr)
    end
  end
  b.report('merge_sort: ') do
    100_000.times do
      merge_sort(arr)
    end
  end
  b.report('quick_sort: ') do
    100_000.times do
      quick_sort(arr)
    end
  end
  b.report('bucket_sort: ') do
    100_000.times do
      bucket_sort(arr)
    end
  end
  b.report('heap_sort: ') do
    100_000.times do
      heap_sort(arr)
    end
  end
  b.report('quick_sort: ') do
    100_000.times do
      quick_sort(arr)
    end
  end
end
