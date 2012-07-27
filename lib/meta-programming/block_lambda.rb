class Array
  def iterate_with_lambda!(code)
    self.each_with_index do |n, i|
      self[i] = code.call(n)
    end
  end
end

##########################################################
# Iterate with lambda
a4 = [1, 2, 3, 4]
a4.iterate_with_lambda!(lambda { |n| n ** 2 } )

puts a4.inspect