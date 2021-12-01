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

RSpec.describe SecondComparator do
  it 'succeeds' do
    readings = [
      199, #  A
      200, #  A B
      208, #  A B C
      210, #    B C D
      200, #  E   C D
      207, #  E F   D
      240, #  E F G
      269, #    F G H
      260, #      G H
      263, #        H
    ].map { |raw_reading|
      DepthReading.new(raw_reading)
    }
    counter = SecondComparator.new(readings).compare
    expect(counter.count).to eq(5)
  end
end
