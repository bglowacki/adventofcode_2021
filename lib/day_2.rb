class Submarine
  def initialize
    @x = 0
    @y = 0
  end

  def follow_instructions(input)
    input.each do |movement|
      direction, step = movement.split(" ")
      case direction
      when "forward"
        @x += step.to_i
      when "up"
        @y -= step.to_i
      when "down"
        @y += step.to_i
      end
    end
  end

  def position
    @x * @y
  end
end
