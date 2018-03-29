class Array
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

  def bucket_sort()
    return self if empty?
    array = self
    bucket_size = 5
    min_value = array.min
    max_value = array.max

    #initialize bucket array
    bucket_count = ((max_value - min_value) / bucket_size).floor + 1
    #set array buckets length
    buckets = Array.new(bucket_count)
    (0..buckets.length - 1).each do |b|
      buckets[b] = []
    end


    # place input array values into buckets
    (0..array.length - 1).each do |i|
      #   # use .floor to make it a whole number
      bucket_idx = ((array[i] - min_value) / bucket_size).floor
      buckets[bucket_idx].push(array[i])
    end

    array.clear
    (0...buckets.length).each do |i|
      buckets[i].quick_sort
      buckets[i].each do |j|
        array.push(j)
      end
    end
    array
  end

  def heap_sort
    return self if length <= 1
    build_heap

    last_element = length - 1

    while last_element > 0
      swap(0, last_element)
      heapify(0, last_element)
      last_element -= 1
    end
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
        if val <= sorted_arr[sorted_arr_index]
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
      self[min_index] = tmp
    end

    return self
  end


  private

  # turn array into heap
  def build_heap
    parent = (size / 2 - 1).floor

    while parent >= 0
      heapify(parent, size)
      parent -= 1
    end
  end

  # restructure heap after removing root
  def heapify(i, max)
    while i < max
      index = i
      left_child = (i * 2) + 1
      right_child = left_child + 1

      return if right_child >= max && left_child >= max

      if right_child >= max || self[left_child] > self[right_child]
        max_child = left_child
      else
        max_child = right_child
      end

      if self[index] < self[max_child]
        index = max_child
      end

      return if index == i
      swap(i, index)
      i = index
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
