class Movement
  attr_reader :step

  def initialize(direction, step)
    @direction = direction
    @step = step.to_i
  end

  def up?
    @direction == "up"
  end

  def forward?
    @direction == "forward"
  end

  def down?
    @direction == "down"
  end
end
