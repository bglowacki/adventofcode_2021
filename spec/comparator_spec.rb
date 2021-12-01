require 'day_1.rb'

RSpec.describe Comparator do
  it 'succeeds' do
    readings = [
      199,
      200,
      208,
      210,
      200,
      207,
      240,
      269,
      260,
      263,
    ].map { |raw_reading|
      DepthReading.new(raw_reading)
    }
    counter = Comparator.new(readings).compare
    expect(counter.count).to eq(7)
  end
end
