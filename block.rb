##########################################################
# Blocks #################################################
##########################################################
class Array
  # All these methods are merely identical, we just want to
  # be absolutely certain which method we are calling and 
  # what its exact functionality is and does.
  def iterate_with_yield!
    self.each_with_index do |n, i|
      self[i] = yield(n)
    end
  end

  def iterate_with_block!(&code)
    self.each_with_index do |n, i|
      self[i] = code.call(n)
    end
  end

  def iterate_with_proc!(code)
    self.each_with_index do |n, i|
      self[i] = code.call(n)
    end
  end

  def iterate_with_lambda!(code)
    self.each_with_index do |n, i|
      self[i] = code.call(n)
    end
  end

end

##########################################################
# Iterate with yield
a1 = [1, 2, 3, 4]
a1.iterate_with_yield! do |n|
  n ** 2
end

##########################################################
# Iterate with block
a2 = [1, 2, 3, 4]
a2.iterate_with_block! do |n|
  n ** 2
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

##########################################################
# Iterate with lambda
a4 = [1, 2, 3, 4]
a4.iterate_with_lambda!(lambda { |n| n ** 2 } )

##########################################################
# Proc vs Lambda in anonymous method calls
def args(code)
  one, two = 1, 2
  code.call(one, two)
end

begin
  args(Proc.new{|a, b, c| puts "Give me a #{a} and a #{b} and a #{c.class}"})
  args(lambda{|a, b, c| puts "Give me a #{a} and a #{b} and a #{c.class}"})
rescue ArgumentError => e
  puts "COMPILER ERROR => #{e}"
end

##########################################################
# Proc vs Lambda in method return
def proc_return
  Proc.new { return "Proc.new"}.call
  return "proc_return method finished"
end

def lambda_return
  lambda { return "lambda" }.call
  return "lambda_return method finished"
end

begin
  puts proc_return
  puts lambda_return
rescue => e
  puts "COMPILER ERROR => #{e}"
end

##########################################################
# Proc vs Lambda in passing return
def generic_return(code)
  code.call
  return "generic_return method finished"
end

begin
  puts generic_return(Proc.new { return "Proc.new" })
  puts generic_return(lambda { return "lambda" })
rescue LocalJumpError => e
  puts "COMPILER ERROR => #{e}"
end

##########################################################
# Examples
def anonymous code, number
  code.call number
end

result = anonymous(lambda { |n|
  return n ** 5 + 1
}, 5)

hycu = Proc.new { |x, y|
  x + y unless x.nil? && y.nil?
}

puts result
puts hycu.call(1,2)

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









