class Array
  attr_reader :sorted
  def initialize
    @sorted = []
  end

  def bubble_sort
    return self if length <= 1
    n = size

    begin
      swapped = false
      (n - 1).times do |i|
        # iterate over collection, continue until there are no more items to swap
        if self[i] > self[i + 1]
          tmp = self[i]
          self[i] = self[i + 1]
          self[i + 1] = tmp
          swapped = true
        end
      end
    end until not swapped

    return self
  end

  def bucket_sort
    return self if length <= 1

    min_value = self.min
    max_value = self.max

    bucket_size = size
    bucket_count = ((max_value - min_value) / bucket_size).floor + 1

    buckets = Array.new(bucket_count)

    # init buckets
    (0..buckets.length - 1).each do |i|
      buckets[i] = []
    end

    (0..size - 1).each do |j|
      buckets[((self[j] - min_value) / bucket_size).floor].push(self[j])
    end

    clear
    buckets.length
    # (0..buckets.length = 1).each do |b|
    #   buckets[b].insertion_sort
    # end
  end

  def heap_sort
    puts "--------HEAP_SORT START--------"
    # return self if size <= 1
    build_max_heap

    last_element = size - 1

    while last_element > 0
      swap(0, last_element)

      heapify(0, last_element)
      last_element -= 1

    end
    puts "--------HEAP_SORT END--------"
    self
  end

  def insertion_sort
    return self if length <= 1
    sorted_arr = [delete_at(0)]

    # iterate over sorted_arr
    for val in self do
      sorted_arr_index = 0

      #  insert element in correct location
      while sorted_arr_index < sorted_arr.length
        if val <=sorted_arr[sorted_arr_index]
          # if val is less than or equal to element at index, insert it
          sorted_arr.insert(sorted_arr_index, val)
          break

          # at end of array, append final val
        elsif sorted_arr_index == sorted_arr.length - 1
          sorted_arr.insert(sorted_arr_index + 1, val)
          break
        end
        sorted_arr_index += 1
      end
    end

    return sorted_arr
  end

  def merge_sort
    # return arr if it has a length of 0 or 1
    if length <= 1
      return self
    else
      # split arr in half, set mid to the middle
      # keep going until sub arrays have length 1
      mid = (self.length / 2).floor
      left = self[0..mid - 1].merge_sort
      right = self[mid..self.length].merge_sort

      merge(left, right)
    end
  end

  def quick_sort
    return self if length <= 1

    pivot = delete_at(rand(size)) # random index value

    # everything to the left of pivot put in "left" # everything to right of pivot, put in "right"
    left, right = partition(&pivot.method(:>))

    # [...left], pivot, [...right]
    return *left.quick_sort, pivot, *right.quick_sort
  end

  def selection_sort
    return self if length <= 1

    length = size

    for i in 0..length - 2 do
      # outer loop assumes min is at current index
      min_index = i

      for j in (i + 1)...length do
        # iterate over unsorted portion of arr, if an item is less than the min item, we set it to the new min item
        if self[j] < self[min_index]
          min_index = j
        end
      end

      # Swap - save current val at i so it isnt overwritten
      # set current_index val to arr[min_index]
      # set arr[min_index] to tmp
      tmp = self[i]
      self[i] = self[min_index]
      self[min_index]= tmp
    end

    return self
  end


  private

  # turn array into heap
  def build_max_heap
    puts "--------BUILD_MAX_HEAP START--------"
    parent = (size / 2 - 1).floor

    while parent >= 0
      heapify(parent, size)
      parent -= 1
    end
    puts "--------BUILD_MAX_HEAP END--------"
  end

  # restructure heap after removing root
  def heapify(parent, heap_size)
    puts "--------HEAPIFY START--------"
    puts "ARGS( p: #{parent}, size: #{heap_size})"
    while parent < heap_size

      left_child = (parent * 2) + 1
      right_child = left_child + 1

      puts "IN WHILE p:#{self[parent]} L: #{self[left_child]} R: #{self[right_child]} sz: #{heap_size}"

      max = parent

      if left_child < heap_size && self[parent] < self[left_child]
        max = left_child
        puts "max: #{self[max]}  p: #{self[parent]}"
        max
      end

      if right_child < heap_size && self[parent] < self[right_child]
        max = right_child
        puts "in right max: #{self[max]}  p: #{self[parent]} "
        max
      end

      return if max == parent
      swap(parent, max)


      puts "size #{heap_size}"
      puts "--------HEAPIFY END--------"
      parent = max
    end
  end


  def merge(left, right)
    if left.empty?
      # return right if left doesnt exist
      right
    elsif right.empty?
      # return left if right doesnt exist
      left
    elsif left.first < right.first
      [left.first] + merge(left[1..left.length], right)
    else
      [right.first] + merge(left, right[1..right.length])
    end
  end

  def swap(a, b)
    self[a], self[b] = self[b], self[a]
  end
end
