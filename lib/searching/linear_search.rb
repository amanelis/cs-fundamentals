def linear_search value, array

  array.each do |v|
    return true if v == value
  end

  return false
end

results = linear_search 9, [5,3,7,2,1,9,12,0,4]
puts results
