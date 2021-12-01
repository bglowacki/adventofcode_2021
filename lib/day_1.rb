require_relative "day_1/depth_reading"
require_relative "day_1/comparator"
require_relative "day_1/second_comparator"

readings_path = File.join(File.dirname(__FILE__), "day_1/readings.txt")

readings = File.readlines(readings_path).map do |raw_reading|
  DepthReading.new(raw_reading)
end

pp Comparator.new(readings).compare
pp SecondComparator.new(readings).compare
