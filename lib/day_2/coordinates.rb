class Coordinates
  def initialize(x = 0, y = 0)
    @x = x
    @y = y
  end

  def update(movement)
    add_x movement.step if movement.forward?
    subtract_y movement.step if movement.up?
    add_y movement.step if movement.down?
  end

  def current_position
    @x * @y
  end

  private

  def add_x(x)
    @x += x
  end

  def add_y(y)
    @y += y
  end

  def subtract_y(y)
    @y -= y
  end
end


class AimedCoordinates < Coordinates
  def initialize(x = 0, y = 0, aim = 0)
    @x = x
    @y = y
    @aim = aim
  end

  def update(movement)
    if movement.forward?
      add_x(movement.step)
      add_y(movement.step * @aim)
    end

    if movement.up?
      subtract_aim movement.step
    end

    if movement.down?
      add_aim movement.step
    end
  end

  private

  def add_aim(aim)
    @aim += aim
  end

  def subtract_aim(aim)
    @aim -= aim
  end
end
