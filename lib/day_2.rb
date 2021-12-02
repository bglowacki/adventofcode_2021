class Coordinates
  def initialize(x=0, y=0)
    @x = x
    @y = y
  end

  def add_x(x)
    @x += x
  end

  def add_y(y)
    @y += y
  end

  def subtract_y(y)
    @y -= y
  end

  def position
    @x * @y
  end
end

class Submarine
  def initialize
    @coordinates = Coordinates.new
  end

  def follow_instructions(input)
    input.each do |movement|
      direction, step = movement.split(" ")
      case direction
      when "forward"
        @coordinates.add_x step.to_i
      when "up"
        @coordinates.subtract_y step.to_i
      when "down"
        @coordinates.add_y step.to_i
      end
    end
  end

  def position
    @coordinates.position
  end
end
