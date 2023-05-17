require 'rspec'
require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
    it "exists" do
        board = Board.new

        expect(board).to be_an_instance_of(Board)
    end

    #Tested if it has a hash of cells using pry

    it "can test if a coordinate is valid" do
        board = Board.new

        expect(board.valid_coordinate?("A1")).to eq(true)
        expect(board.valid_coordinate?("D4")).to eq(true)
        expect(board.valid_coordinate?("E1")).to eq(false)
        expect(board.valid_coordinate?("A22")).to eq(false)
    end

    it "can test if coordinates are on the board" do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        expect(board.valid_placement?(cruiser, ["F1", "F2", "F3"])).to eq(false)
    end


    it "can test if coordinates are on the board with missing letter or number" do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        expect(board.valid_placement?(cruiser, ["A2", "1", "B"])).to eq(false)

    end

    it "can test that the number of coordinates should be the same as the length of ship" do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
        expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
        
    end

    it "can test that the coordinates must be consecutive" do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
        expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
        expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
        expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)

    end

    it "can test that the coordinates can't be diagonal" do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
        expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)

    end

    it "can test that the check that valid coordiates are true" do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
        expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)

    end

    it "can test that the coordinates can't repeat" do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        expect(board.valid_placement?(submarine, ["A1", "A1"])).to eq(false)
        expect(board.valid_placement?(cruiser, ["A1", "B1", "B1"])).to eq(false)

    end



    it "can place ships" do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        board.place(cruiser, ["A1", "A2", "A3"])
        board.place(submarine, ["B3", "C3"])

        expect(board.cells["A1"].ship).to eq([cruiser])
        expect(board.cells["A2"].ship).to eq([cruiser])
        expect(board.cells["A3"].ship).to eq([cruiser])

        expect(board.cells["B3"].ship).to eq([submarine])
        expect(board.cells["C3"].ship).to eq([submarine])
    end

    it "can prevent overlapping placement of ships" do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        board.place(cruiser, ["A1", "A2", "A3"])
        expect(board.place(submarine, ["A1", "B1"])).to eq("Those were not valid placements for your ship. Try again.")
    end

    it "can render a board" do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        board.place(cruiser, ["A1", "A2", "A3"])
        board.place(submarine, ["B2", "C2"])

        expect(board.render).to eq(nil)
        expect(board.render(true)).to eq(nil)
        #check printout to see if board is correct
    end

    it "can render a board after shots fired" do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        board.place(cruiser, ["A1", "A2", "A3"])
        board.place(submarine, ["B2", "C2"])

        board.cells["A1"].fire_upon
        board.cells["D1"].fire_upon
        board.cells["B2"].fire_upon
        board.cells["C2"].fire_upon




        expect(board.render).to eq(nil)
        expect(board.render(true)).to eq(nil)
        #check printout to see if board is correct
    end

        


end