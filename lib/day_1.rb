class DepthReading
  attr_reader :reading

  def initialize(reading)
    @reading = reading.to_i
  end

  def > (other)
    @reading > other.reading
  end
end

class Counter
  def initialize
    @count = 0
  end

  def increment
    @count += 1
  end

  def count
    @count
  end
end

class Comparator
  def initialize(readings)
    @counter = Counter.new
    @readings = readings
  end

  def compare
    @readings.each_cons(2) do |current_reading, next_reading|
      @counter.increment if increased?(current_reading, next_reading)
    end
    @counter
  end

  private

  def increased?(current_reading, next_reading)
    next_reading > current_reading
  end
end

readings_path = File.join(File.dirname(__FILE__), "readings.txt")


readings = File.readlines(readings_path).map do |raw_reading|
  DepthReading.new(raw_reading)
end

pp Comparator.new(readings).compare



