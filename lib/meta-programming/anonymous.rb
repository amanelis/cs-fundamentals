##########################################################
# Anonymous Examples
def anonymous code, number
  code.call number
end

def pass_block(&block)
  yield(block)
end

result = anonymous(lambda { |n|
  return n ** 5 + 1
}, 5)

hycu = Proc.new { |x, y|
  x + y unless x.nil? && y.nil?
}

pass_block do |n|
  n = 5 * 4
  puts "Calculated #{n}"
end

puts result
puts hycu.call(1,2)











