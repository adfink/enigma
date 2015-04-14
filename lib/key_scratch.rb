class Key

  attr_reader :key

  def initialize(numbers = generate)
    @key = numbers
  end
