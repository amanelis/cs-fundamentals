class Array
  def iterate_with_yield!
    self.each_with_index do |n, i|
      self[i] = yield(n)
    end
  end
end

##########################################################
# Iterate with yield
a1 = [1, 2, 3, 4]
a1.iterate_with_yield! do |n|
  n ** 2
end

puts a1.inspect