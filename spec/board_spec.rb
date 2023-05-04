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


end