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

end