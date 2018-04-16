def improved_algorithm(*arrays)
  combined_array = arrays.reduce([], :concat)

  return combined_array if combined_array.length <= 1

  pivot = combined_array.delete_at(rand(combined_array.length))

  left, right = combined_array.partition(&pivot.method(:>))
  return improved_algorithm(left), [pivot], improved_algorithm(right)
end
