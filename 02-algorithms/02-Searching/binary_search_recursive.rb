def bs_recursive(arr, val)
  low = 0
  high = arr.length - 1
  mid = (low + high) / 2

  return mid if val == mid

  if arr[mid] > val
    bs_recursive(arr[0, mid - 1], val)
  elsif arr[mid] < val
    bs_recursive(arr[mid + 1, high], val)
  end


end
