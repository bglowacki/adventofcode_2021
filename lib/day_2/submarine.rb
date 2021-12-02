require_relative "coordinates"

class Submarine
  def initialize
    @coordinates = Coordinates.new
  end

  def load_plan(plan)
    @plan = plan
  end

  def move_according_to_plan
    @plan.movements.each do |movement|
      @coordinates.update(movement)
    end
  end

  def move(direction, step)
    @coordinates.update(direction, step)
  end

  def position
    @coordinates.current_position
  end
end
