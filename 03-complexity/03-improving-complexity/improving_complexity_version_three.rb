def poorly_written_ruby(*arrays)
  combined_array = arrays.reduce([], :concat)

  return combined_array if combined_array.length <= 1

  my_hash = Hash[(0..combined_array.size - 1).zip combined_array]

  return my_hash.sort_by { |k, v| v}.to_h
end

a = [3, 6, 9, 8, 7]
b = [2, 1, 5, 4]
puts poorly_written_ruby(a,b)
