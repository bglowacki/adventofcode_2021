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

class GroupReadings
  def initialize(readings)
    @readings = readings
  end

  def by(number=3)
    @readings.each_cons(number).map do |readings|
      GroupedReading.new(readings)
    end
  end
end
