require 'rspec'
require './lib/ship'

RSpec.describe Ship do
  it "exists" do
    ship = Ship.new("Curiser", 3)

    expect ship to_be_an_instance_of(Ship)
  end

end