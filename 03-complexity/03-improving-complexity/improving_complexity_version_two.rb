def poorly_written_ruby(*arrays)
  combined_array = arrays.reduce([], :concat)

  return combined_array if combined_array.length <= 1

  pivot = combined_array.delete_at(rand(combined_array.length))

  left, right = combined_array.partition(&pivot.method(:>))
  return poorly_written_ruby(left), [pivot], poorly_written_ruby(right)
end
