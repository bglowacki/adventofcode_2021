require_relative "day_1/get_readings"
require_relative "day_1/group_readings"
require_relative "day_1/comparator"

readings_path = File.join(File.dirname(__FILE__), "day_1/readings.txt")

depth_readings = GetReadings.call(readings_path)

grouped_readings = GroupReadings.new(depth_readings).by(3)

pp Comparator.new(depth_readings).compare
pp Comparator.new(grouped_readings).compare
