class Operation
    def initialize(operator)
        # Expects a text operator, like '+'
        @operator = operator
    end
    def operate(lhs, rhs)
        # Applies a text operator as a method
        lhs.public_send @operator, rhs
    end
end

def getOperationFor(operator)
    if ["plus", "add", "+"].include? operator
        return Operation.new '+'
    elsif ["minus", "less", "subtract", "-"].include? operator
        return Operation.new '-'
    elsif ["times", "multiply", "*", "x"].include? operator
        return Operation.new '*'
    elsif ["divided by", "split by", "/"].include? operator
        return Operation.new '/'
    else
        puts "Sorry, I don't know how to do #{operator}!"
        exit
    end
end

def askUserToCalculate
  print "What's the first number? "
  lhs = gets.to_f
  print "What's the operator? "
  operation = getOperationFor(gets.chomp)
  print "What's the second number? "
  rhs = gets.to_f
  result = operation.operate lhs, rhs
  puts "The result is #{sprintf '%g', result}!"
end

puts "Hi! I can help you do simple calculations on two numbers."
while true
    askUserToCalculate
    print "Do you want to calculate something else? (y/n) "
    if gets.chomp != "y"
        puts "That was fun! Bye-bye!"
        break
    end
end