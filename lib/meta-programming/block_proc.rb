class Array
  def iterate_with_proc!(code)
    self.each_with_index do |n, i|
      self[i] = code.call(n)
    end
  end
end

##########################################################
# Iterate with proc
a3_1 = [1, 2, 3, 4]
a3_2 = [1, 2, 3, 4]

# Option 1
square = Proc.new do |n|
  n ** 2
end
a3_1.iterate_with_proc!(square)

# Option 2
a3_2.iterate_with_proc!(Proc.new do |n| 
    n ** 2
end)

puts a3_1.inspect
puts a3_2.inspect

