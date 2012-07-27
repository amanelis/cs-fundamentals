##########################################################
# Basic Closure in Ruby
##########################################################
class Array
  def iterate!(code)
    self.each_with_index do |n, i|
      self[i] = code.call(n)
    end
  end
end

def square(n)
  n ** 2
end

[1, 2, 3, 4].iterate!(method(:square))