class Key

  attr_reader :key
  def initialize(starter_key = generate)
    @key = starter_key
  end

  def generate
    @key = (0..4).map { rand(9) }.join
  end

  def rotator_values
    @key.to_s.chars.each_cons(2).map(&:join).map(&:to_i)
  end

end

