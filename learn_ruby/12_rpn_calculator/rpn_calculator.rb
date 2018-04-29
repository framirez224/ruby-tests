class RPNCalculator
  def initialize
    @stack = []
  end

  def push(val)
    @stack.push(val)
  end

  def times
    push(:*)
  end

  def plus
    push(:+)
  end

  def minus
    push(:-)
  end

  def divide
    push(:/)
  end

  def value
    operation = @stack.pop
    second = @stack.pop
    first = @stack.pop

    first.send(operation, second).tap do |answer|
      @stack.push(answer)
    end
  end

  private

  attr_accessor :stack
end
