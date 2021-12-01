class DepthReading
  attr_reader :reading

  def initialize(reading)
    @reading = reading.to_i
  end

  def > (other)
    @reading > other.reading
  end
end
