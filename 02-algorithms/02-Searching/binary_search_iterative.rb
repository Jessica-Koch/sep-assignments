def bs_iterative(arr, val)
  low = 0
  high = arr.length - 1

  while low <= high
    mid = (low + high) / 2
    if arr[mid] > val
      high = mid - 1
    elsif arr[mid] < val
      low = mid + 1
    else
      return mid
    end
  end

  return 'not foun'
end
