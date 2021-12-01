require_relative "day_1/depth_reading"
require_relative "day_1/grouped_reading"
require_relative "day_1/comparator"

readings_path = File.join(File.dirname(__FILE__), "day_1/readings.txt")

depth_readings = File.readlines(readings_path).map do |raw_reading|
  DepthReading.new(raw_reading)
end

grouped_readings = GroupReadings.new(depth_readings).by(3)

pp Comparator.new(depth_readings).compare
pp Comparator.new(grouped_readings).compare
