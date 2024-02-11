class Operation
    def initialize(operator)
        @operator = operator
    end
    def operate(lhs, rhs)
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
  userLhs = gets.to_f
  print "What's the operator? "
  userOperator = gets.chomp
  print "What's the second number? "
  userRhs = gets.to_f
  result = getOperationFor(userOperator).operate userLhs, userRhs
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