require_relative "day_2/plan"
require_relative "day_2/submarine"

plan_path = File.join(File.dirname(__FILE__), "day_2/input.txt")
raw_plan = File.readlines(plan_path)

plan = Plan.new(raw_plan)
submarine = Submarine.new

submarine.load_plan(plan)
submarine.move_according_to_plan

pp submarine.position
