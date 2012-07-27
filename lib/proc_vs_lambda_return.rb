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