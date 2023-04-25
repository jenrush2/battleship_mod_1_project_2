require 'rspec'
require './lib/ship'

RSpec.describe Ship do
  it "exists" do
    ship = Ship.new("Cruiser", 3)

    expect(ship).to be_an_instance_of(Ship)
  end

  it "has a name" do
    ship = Ship.new("Cruiser", 3)

    expect(ship.name).to eq("Cruiser")
  end

  it "has a length" do
    ship = Ship.new("Cruiser", 3)

    expect(ship.length).to eq(3)
  end

  it "has health that equals length" do
    ship = Ship.new("Cruiser", 3)

    expect(ship.health).to eq(3)
  end

  it "can test for sunk" do
    ship = Ship.new("Cruiser", 3)

    expect(ship.sunk?).to eq(false)
  end

  it "can take a hit and change health" do
    ship = Ship.new("Cruiser", 3)

    ship.hit

    expect(ship.health).to eq(2)

    ship.hit

    expect(ship.health).to eq(1)

    expect(ship.sunk?).to eq(false)

    ship.hit
    
    expect(ship.health).to eq(0)

    expect(ship.sunk?).to eq(true)

  end

end