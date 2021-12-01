require_relative "counter"

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
