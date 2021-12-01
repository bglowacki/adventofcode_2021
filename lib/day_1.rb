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

class GroupedReading
  def initialize(readings)
    @readings = readings
  end

  def sum
    @readings.inject(0) { |sum, reading| sum + reading.reading }
  end

  def >(other_reading)
    sum > other_reading.sum
  end
end

class SecondComparator
  def initialize(readings)
    @counter = Counter.new
    @readings = readings
  end

  def compare
    group_readings = @readings.each_cons(3).map do |readings|
      GroupedReading.new(readings)
    end


    group_readings.each_cons(2) do |current_reading, next_reading|
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
pp SecondComparator.new(readings).compare



