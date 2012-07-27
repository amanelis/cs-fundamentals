##########################################################
# Anonymous Examples
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











