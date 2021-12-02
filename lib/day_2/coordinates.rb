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
