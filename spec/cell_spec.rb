require 'rspec'
require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
    it "exists" do
        cell = Cell.new("B3")

        expect(cell).to be_an_instance_of(Cell)
    end

    it "has a coordinate" do
        cell = Cell.new("B3")

        expect(cell.coordinate).to eq("B3")
    end

    it "starts without a ship" do
        cell = Cell.new("B3")

        expect(cell.ship).to eq([])
    end

    it "starts empty" do
        cell = Cell.new("B3")

        expect(cell.empty?).to eq(true)
    end

    it "can place a ship in the cell" do
        cell = Cell.new("B3")
        cruiser = Ship.new("Cruiser", 3)
        cell.place_ship(cruiser)

        expect(cell.ship).to eq([cruiser])
        expect(cell.empty?).to eq(false)
    end

    it "starts having not been fired upon" do
        cell = Cell.new("B3")
        cruiser = Ship.new("Cruiser", 3)
        cell.place_ship(cruiser)

        expect(cell.fired_upon?).to eq(false)
    end

    it "can be fired upon" do
        cell = Cell.new("B3")
        cruiser = Ship.new("Cruiser", 3)
        cell.place_ship(cruiser)
        cell.fire_upon
        
        expect(cell.fired_upon?).to eq(true)
        expect(cruiser.health).to eq(2)
    end


end