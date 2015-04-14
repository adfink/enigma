class Grouper
  attr_reader :message, :chunks
  # attr_reader :slices
  def initialize(message=nil)
    @message = message
  end

  def chunk
    @chunks = @message.chars.each_slice(4).map {|slice| slice }
    return @chunks
  end
end
