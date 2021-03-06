require_relative "grouped_reading"


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
