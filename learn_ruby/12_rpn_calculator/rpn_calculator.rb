class RPNCalculator
  def initialize
    @stack = []
    @value = nil
  end

  def push(val)
    @stack.push(sanitize(val))
  end

  def times
    push(:*)
    evaluate
  end

  def plus
    push(:+)
    evaluate
  end

  def minus
    push(:-)
    evaluate
  end

  def divide
    push(:/)
    evaluate
  end

  attr_accessor :value

  private

  def evaluate
    operation = @stack.pop
    second = @stack.pop
    first = @stack.pop

    @value = first.send(operation, second).tap do |answer|
      @stack.push(answer)
    end
  end

  def sanitize(input)
    if input.respond_to?(:to_f)
      input.to_f
    elsif input.is_a?(Symbol)
      raise StandardError, 'Calculator is empty' if @stack.empty?
      input
    else
      raise ArgumentError, 'Invalid input'
    end
  end

  attr_accessor :stack
end
