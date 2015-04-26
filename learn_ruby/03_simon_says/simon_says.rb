
def echo(str)
   str
end

def shout(str)
   str.upcase
end

def repeat(str, num = 2)
   out = ""
   num.times do
      out += str + " "
   end
   out.chomp(" ")
end

def start_of_word(str, num_letters = 1)
   str[0..(num_letters-1)]
end

def first_word(str)
   str.each_line(" ").next().chomp(" ")
end

def titleize(str)

   little_words = ["or", "and", "over", "the"]

   parts = str.scan(/\w+/)

   parts.map.with_index { |word, i| (little_words.include?(word) && (i != 0)) ? word : word.capitalize }.join(" ")

end
