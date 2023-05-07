require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'

class Game
    attr_reader :comp_board, :player_board, :computer_cruiser, :computer_submarine, :player_1_cruiser, :player_1_submarine

    def initialize
        @comp_board = Board.new
        @player_board = Board.new
        @computer_cruiser = Ship.new("Cruiser", 3)
        @computer_submarine = Ship.new("Submarine", 2)
        @player_1_cruiser = Ship.new("Cruiser", 3)
        @player_1_submarine = Ship.new("Submarine", 2)
    end

    def start
        puts "Welcome to BATTLESHIP!\n"+
        "Enter p to play. Enter q to quit"
        usrin = gets.chomp
        if usrin == "p"
            array_of_board_coordinates = comp_board.cells.keys
            computer_cruiser_array = array_of_board_coordinates.sample(3) 
            while comp_board.valid_placement?(computer_cruiser, computer_cruiser_array) == false
                computer_cruiser_array = array_of_board_coordinates.sample(3)
                computer_cruiser_array
            end
            comp_board.place(computer_cruiser, computer_cruiser_array)
            array_of_board_coordinates_minus_cruiser = array_of_board_coordinates - computer_cruiser_array
            computer_submarine_array = array_of_board_coordinates_minus_cruiser.sample(2)
            while comp_board.valid_placement?(computer_submarine, computer_submarine_array) == false
                computer_submarine_array = array_of_board_coordinates_minus_cruiser.sample(2)
                computer_submarine_array
            end
            comp_board.place(computer_submarine, computer_submarine_array)
            comp_board.render(true)

        elsif usrin == "q"
        else 
            start
        end    
    end


end