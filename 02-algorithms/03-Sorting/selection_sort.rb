def selection_sort(arr)
  length = arr.length

  for i in 0..length - 2 do
    # outer loop assumes min is at current index
    min_index = i

    for j in (i + 1)...length do
      # iterate over unsorted portion of arr, if an item is less than the min item, we set it to the new min item
      if arr[j] < arr[min_index]
        min_index = j
      end
    end

    # Swap - save current val at i so it isnt overwritten
    # set current_index val to arr[min_index]
    # set arr[min_index] to tmp
    tmp = arr[i]
    arr[i] = arr[min_index]
    arr[min_index]= tmp
  end

  return arr
end
