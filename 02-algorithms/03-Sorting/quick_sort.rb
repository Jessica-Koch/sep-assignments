class Array
  def quick_sort
    return [] if empty?

    pivot = delete_at(rand(size)) # random index value

    # everything to the left of pivot put in "left" # everything to right of pivot, put in "right"
    left, right = partition(&pivot.method(:>))


    return *left.quick_sort, pivot, *right.quick_sort
  end

end
