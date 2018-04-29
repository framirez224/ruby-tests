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
    evaluate_next
  end

  def plus
    push(:+)
    evaluate_next
  end

  def minus
    push(:-)
    evaluate_next
  end

  def divide
    push(:/)
    evaluate_next
  end

  def tokens(input)
    @stack = tokenize(input)
  end

  attr_accessor :value

  private

  def tokenize(input)
    input.split(' ').map do |item|
      begin
        Integer(item)
      rescue ArgumentError
        item.to_sym
      end
    end
  end

  def evaluate_next
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
