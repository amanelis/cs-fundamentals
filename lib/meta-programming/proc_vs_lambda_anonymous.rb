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