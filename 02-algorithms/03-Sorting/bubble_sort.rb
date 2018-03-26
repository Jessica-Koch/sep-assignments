def bubble_sort(arr)
  n = arr.length

  begin
    swapped = false

    (n - 1).times do |i|
      # iterate over collection, continue until there are no more items to swap
      if arr[i] > arr[i + 1]
        tmp = arr[i]
        arr[i] = arr[i + 1]
        arr[i + 1] = tmp
        swapped = true
      end
    end
  end until not swapped

  return arr
end
