
def hello(name = "")
   other_part = (name == "") ? "!" : ", " + name + "!"
   "Hello" + other_part
end

def greet(name)
   hello(name)
end