require_relative "movement"

class Plan
  attr_reader :movements

  def initialize(raw_movements)
    @movements = raw_movements.map do |movement|
      direction, step = movement.split(" ")
      Movement.new(direction, step)
    end
  end
end
