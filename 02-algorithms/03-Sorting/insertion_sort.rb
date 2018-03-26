def insertion_sort(arr)
  sorted_arr = [arr.delete_at(0)]

  # iterate over sorted_arr
  for val in arr do
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
