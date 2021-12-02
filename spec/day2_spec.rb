require "day_2"

RSpec.describe Submarine do
  let(:input) {
    [
      "forward 5",
      "down 5",
      "forward 8",
      "up 3",
      "down 8",
      "forward 2",
    ]
  }

  it 'succeeds' do
    submarine = Submarine.new
    plan = Plan.new(input)
    submarine.load_plan(plan)
    submarine.move_according_to_plan
    expect(submarine.position).to eq(150)
  end
end

