def binary_search array, left, right, value
  return -1 if left > right

  middle = (left + right) / 2

  if array[middle] == value
    middle
  elsif value < array[middle]
    binary_search array, left, middle - 1, value
  else
    binary_search array, middle + 1, right, value
  end
end

results = binary_search [5,2,9,7,10,4,6,3,1,8], 0, 10, 3
puts results
