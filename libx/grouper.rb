class Grouper
  attr_reader :message
  def initialize(message = nil)
    @message = message.downcase
  end

  def chunk
    @message.chars.each_slice(4).map { |slice| slice }
  end

end
