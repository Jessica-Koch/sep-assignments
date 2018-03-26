def merge_sort(arr)
  # return arr if it has a lenght of 0 or 1
  if arr.length <= 1
    return arr
  else
    # split arr in half, set mid to the middle
    # keep going until sub arrays have length 1
    mid = (arr.length / 2).floor
    left = merge_sort(arr[0..mid - 1])
    right = merge_sort(arr[mid..arr.length])

    merge(left, right)
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
