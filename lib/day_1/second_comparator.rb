require_relative "counter"
require_relative "grouped_reading"

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
