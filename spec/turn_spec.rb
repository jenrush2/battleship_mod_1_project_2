require 'rspec'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require './lib/turn'

RSpec.describe Turn do
    it "exists" do
        comp_board = Board.new
        comp_cruiser = Ship.new("Cruiser", 3)
        comp_submarine = Ship.new("Submarine", 2)
        comp_cruiser_array = ["A1", "B1", "C1"]
        comp_submarine_array = ["D3", "D4"]


        comp_board.place(comp_cruiser, comp_cruiser_array)
        comp_board.place(comp_submarine, comp_submarine_array)

        test_player_board = Board.new
        test_player_cruiser = Ship.new("Cruiser", 3)
        test_player_submarine = Ship.new("Submarine", 2)
        test_player_cruiser_array = ["C2", "C3", "C4"]
        test_player_submarine_array = ["A3", "B3"]

        test_player_board.place(test_player_cruiser, test_player_cruiser_array)
        test_player_board.place(test_player_submarine, test_player_submarine_array)



        turn = Turn.new(comp_board, test_player_board)

        expect(turn).to be_an_instance_of(Turn)
    end

    it "shows boards to player (no ships for comp)" do
        comp_board = Board.new
        comp_cruiser = Ship.new("Cruiser", 3)
        comp_submarine = Ship.new("Submarine", 2)
        comp_cruiser_array = ["A1", "B1", "C1"]
        comp_submarine_array = ["D3", "D4"]


        comp_board.place(comp_cruiser, comp_cruiser_array)
        comp_board.place(comp_submarine, comp_submarine_array)

        test_player_board = Board.new
        test_player_cruiser = Ship.new("Cruiser", 3)
        test_player_submarine = Ship.new("Submarine", 2)
        test_player_cruiser_array = ["C2", "C3", "C4"]
        test_player_submarine_array = ["A3", "B3"]

        test_player_board.place(test_player_cruiser, test_player_cruiser_array)
        test_player_board.place(test_player_submarine, test_player_submarine_array)



        turn = Turn.new(comp_board, test_player_board)

        expect(turn.display).to eq(nil)
        #check printout for display
    end

end