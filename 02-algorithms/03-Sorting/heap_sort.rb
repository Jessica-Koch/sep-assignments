def heap_sort(array)
  count = array.length
  heapify(array, count)

  tail = count - 1

  while tail > 0
    swap(array, tail, 0)
    tail -= 1
    build_max_heap(array, 0, tail)
  end
  array
end

# turn array into heap
def build_max_heap(array)
  i = (array.length / 2).floor
  puts "i: #{i} array: #{array}"
  while i >= 1
    puts "i: #{i} array: #{array}"
    heapify(array, i, array.size)
    i -= 1
  end
end

# restructure heap after removing root
def heapify(array, i)
  left_child = (2 * 1) + 1
  right_child = (2 * 1) + 2

  index = i


  if left_child < max && array[left_child] > array[index]
    swap(array, i, index)
    index = left_child
  end

  if right_child < max && array[right_child] > array[index]
    swap(array, i, index)
    index = right_child
  end

  if index == i
    return;
  end

  i = index
end


def swap(array, a, b)
  array[a], array[b] = array[b], array[a]
end
