
require 'pry'

def sum(*numbers)
   numbers = numbers[0] if numbers[0].kind_of?(Array)
   out = numbers.empty? ? 0 : numbers.reduce(:+) 
end

def add(*numbers)
   sum(*numbers)
end

def subtract(*numbers)
   numbers.reduce(:-)
end

def multiply(*numbers)
   numbers.reduce(:*)
end

def power(num, pow)
   out = 1;
   pow.times do 
      out *= num;
   end
   out
end

def factorial(num)
   if num <= 1
      return num
   end

   return factorial(num - 1) * num

end