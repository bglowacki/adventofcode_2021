require_relative "depth_reading"

class GetReadings
  def self.call(path)
    File.readlines(path).map do |raw_reading|
      DepthReading.new(raw_reading)
    end
  end
end
