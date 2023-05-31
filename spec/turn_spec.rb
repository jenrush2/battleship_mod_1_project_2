require 'rspec'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require './lib/turn'

RSpec.describe Turn do
    xit "exists" do
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

    xit "shows boards to player (no ships for comp)" do
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

    xit "lets the player take a shot that's a hit" do
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
        expect(turn.player_shot("A1")).to eq("Your shot on A1 was a hit!")

    end

    xit "lets the player take a shot that's a miss" do
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
        expect(turn.player_shot("C4")).to eq("Your shot on C4 was a miss!")

    end

    xit "lets the player take a shot that sinks a ship" do
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
        turn.player_shot("D3")

        expect(turn.player_shot("D4")).to eq("Your shot on D4 was a hit! You sunk the Submarine!")

    end


    xit "lets the computer take a smart shot when there hasn't been a hit yet" do
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

        expect(turn.computer_shot).to eq("My shot on A1 was a hit!")

    end

    xit "lets the computer take a smart shot when there has previously been a hit" do
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

        test_player_board.cells["A3"].fire_upon
        test_player_board.cells["A4"].fire_upon
       

        expect(turn.computer_shot).to eq("My shot on A2 was a miss!")
        #or gets a hit at B3

    end


    xit "gives the results of both shots" do
        
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

        #turn.player_shot("D3")
        turn.computer_shot
        turn.player_shot("D5")
        
        expect(turn.display_results).to eq("That is not a valid shot. Please try again.")
        #check printout -- not sure how to put two lines into eq()
        
        turn.computer_shot
        turn.player_shot("A2")
        expect(turn.display_results).to eq("Your shot on A2 was a miss!")


        turn.computer_shot
        turn.player_shot("B1")
        expect(turn.display_results).to eq("Your shot on B1 was a hit!")

    end



    xit "lets you know if the coordinates have already been fired upon" do
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

        turn.player_shot("A1")
        turn.player_shot("A1")
        expect(turn.display_results).to eq("You've fired on A1 before. It was already a hit. Way to waste a turn.")

    end

    


end