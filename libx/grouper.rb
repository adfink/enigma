class Grouper
  attr_reader :message
  def initialize(message = nil)
    unless message == nil
      @message = message.downcase
    end
  end

  def chunk
    @message.chars.each_slice(4).map { |slice| slice }
  end

end
