require 'rspec'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'


RSpec.describe Game do
    it "exists" do
        new_game = Game.new

        expect(new_game).to be_an_instance_of(Game)
    end

    it "creates a board for the computer and player" do
        new_game = Game.new

        expect(new_game.comp_board).to be_an_instance_of(Board)
        expect(new_game.player_board).to be_an_instance_of(Board)
    end

    it "enters the game menu using start method" do
        new_game = Game.new

        expect(new_game.start).to eq(nil)
        #check printout for results
    end

#tests written for TURN. when changed to inside game need to test with pry???
    # it "checks to see if the game is over false" do
    #     comp_board = Board.new
    #     comp_cruiser = Ship.new("Cruiser", 3)
    #     comp_submarine = Ship.new("Submarine", 2)
    #     comp_cruiser_array = ["A1", "B1", "C1"]
    #     comp_submarine_array = ["D3", "D4"]


    #     comp_board.place(comp_cruiser, comp_cruiser_array)
    #     comp_board.place(comp_submarine, comp_submarine_array)

    #     test_player_board = Board.new
    #     test_player_cruiser = Ship.new("Cruiser", 3)
    #     test_player_submarine = Ship.new("Submarine", 2)
    #     test_player_cruiser_array = ["C2", "C3", "C4"]
    #     test_player_submarine_array = ["A3", "B3"]

    #     test_player_board.place(test_player_cruiser, test_player_cruiser_array)
    #     test_player_board.place(test_player_submarine, test_player_submarine_array)

    #     turn = Turn.new(comp_board, test_player_board)

    #     turn.player_shot("A1")
    #     turn.computer_shot
    #     turn.player_shot("B1")
    #     turn.computer_shot
    #     turn.player_shot("C1")
    #     turn.computer_shot

    #     expect(turn.game_over?).to eq(false)


    # end

    # it "checks to see if the game is over true" do
    #     comp_board = Board.new
    #     comp_cruiser = Ship.new("Cruiser", 3)
    #     comp_submarine = Ship.new("Submarine", 2)
    #     comp_cruiser_array = ["A1", "B1", "C1"]
    #     comp_submarine_array = ["D3", "D4"]


    #     comp_board.place(comp_cruiser, comp_cruiser_array)
    #     comp_board.place(comp_submarine, comp_submarine_array)

    #     test_player_board = Board.new
    #     test_player_cruiser = Ship.new("Cruiser", 3)
    #     test_player_submarine = Ship.new("Submarine", 2)
    #     test_player_cruiser_array = ["C2", "C3", "C4"]
    #     test_player_submarine_array = ["A3", "B3"]

    #     test_player_board.place(test_player_cruiser, test_player_cruiser_array)
    #     test_player_board.place(test_player_submarine, test_player_submarine_array)

    #     turn = Turn.new(comp_board, test_player_board)

    #     turn.player_shot("A1")
    #     turn.computer_shot
    #     turn.player_shot("B1")
    #     turn.computer_shot
    #     turn.player_shot("C1")
    #     turn.display_results
    #     turn.computer_shot
    #     turn.player_shot("D3")
    #     turn.computer_shot
    #     turn.player_shot("D4")
    #     turn.display_results

    #     expect(turn.game_over?).to eq(true)
    # end

    # it "checks to see if the game is over false" do
    #     comp_board = Board.new
    #     comp_cruiser = Ship.new("Cruiser", 3)
    #     comp_submarine = Ship.new("Submarine", 2)
    #     comp_cruiser_array = ["A1", "B1", "C1"]
    #     comp_submarine_array = ["D3", "D4"]


    #     comp_board.place(comp_cruiser, comp_cruiser_array)
    #     comp_board.place(comp_submarine, comp_submarine_array)

    #     test_player_board = Board.new
    #     test_player_cruiser = Ship.new("Cruiser", 3)
    #     test_player_submarine = Ship.new("Submarine", 2)
    #     test_player_cruiser_array = ["C2", "C3", "C4"]
    #     test_player_submarine_array = ["A3", "B3"]

    #     test_player_board.place(test_player_cruiser, test_player_cruiser_array)
    #     test_player_board.place(test_player_submarine, test_player_submarine_array)

    #     turn = Turn.new(comp_board, test_player_board)

    #     turn.player_shot("A1")
    #     turn.computer_shot
    #     turn.player_shot("B1")
    #     turn.computer_shot
    #     turn.player_shot("C1")
    #     turn.computer_shot
    #     turn.display_results
       

    #     expect(turn.game_over?).to eq(false)
    # end


    # it "checks for a winner if game is over" do
    #     comp_board = Board.new
    #     comp_cruiser = Ship.new("Cruiser", 3)
    #     comp_submarine = Ship.new("Submarine", 2)
    #     comp_cruiser_array = ["A1", "B1", "C1"]
    #     comp_submarine_array = ["D3", "D4"]


    #     comp_board.place(comp_cruiser, comp_cruiser_array)
    #     comp_board.place(comp_submarine, comp_submarine_array)

    #     test_player_board = Board.new
    #     test_player_cruiser = Ship.new("Cruiser", 3)
    #     test_player_submarine = Ship.new("Submarine", 2)
    #     test_player_cruiser_array = ["C2", "C3", "C4"]
    #     test_player_submarine_array = ["A3", "B3"]

    #     test_player_board.place(test_player_cruiser, test_player_cruiser_array)
    #     test_player_board.place(test_player_submarine, test_player_submarine_array)

    #     turn = Turn.new(comp_board, test_player_board)

    #     turn.player_shot("A1")
    #     turn.computer_shot
    #     turn.player_shot("B1")
    #     turn.computer_shot
    #     turn.player_shot("C1")
    #     turn.display_results
    #     turn.computer_shot
    #     turn.player_shot("D3")
    #     turn.computer_shot
    #     turn.player_shot("D4")
    #     turn.display_results

    #     turn.game_over?
        
    #     expect(turn.winner).to eq("Game over! You win!")
    # end



end
