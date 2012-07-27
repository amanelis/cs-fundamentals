class Array
  def iterate_with_block!(&code)
    self.each_with_index do |n, i|
      self[i] = code.call(n)
    end
  end
end

##########################################################
# Iterate with block
a2 = [1, 2, 3, 4]
a2.iterate_with_block! do |n|
  n ** 2
end

puts a2.inspect