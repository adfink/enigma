require './libx/key'
require './libx/date_key'

class CombineOffsets
  attr_reader :key, :date_key
  def initialize(key, date_key)
    @key      = key
    @date_key = date_key
  end

  def offsets
    if @key.rotator_values.length != 4 || date_key.offsets.length != 4
      raise "#{@key.rotator_values} #{date_key.offsets}"
    end
      @key.rotator_values.zip(date_key.offsets).map do |pair|
      pair[0]+pair[1]
    end
  end
end
