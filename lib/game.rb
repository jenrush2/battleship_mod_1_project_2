require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'

class Game
    attr_reader :comp_board, :player_board, :computer_cruiser, :computer_submarine, :player_1_cruiser, :player_1_submarine, :game_over

    def initialize
        @comp_board = Board.new
        @player_board = Board.new
        @computer_cruiser = Ship.new("Cruiser", 3)
        @computer_submarine = Ship.new("Submarine", 2)
        @player_1_cruiser = Ship.new("Cruiser", 3)
        @player_1_submarine = Ship.new("Submarine", 2)
        @game_over = false
    end

    def start
        puts "Welcome to BATTLESHIP!\n"+
        "Enter p to play. Enter q to quit"
        usrin = gets.chomp
        if usrin == "p"
            #Start with computer choosing random valid locations for two ships
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
            #Use line below to see computer ships during debugging
            #comp_board.render(true)

            #Player input to choose valid placements for two ships
            puts "I have laid out my ships on a grid.\n"+
            "You need to place your two ships.\n"+
            "The Cruiser is three units long and the Submarine is two units long."
            player_board.render
            puts "Enter the placement for your Cruiser. Name cells using an uppercase letter and number, such as A3. Separate each coordinate with a comma."
            cruiser_input = gets.chomp
            cruiser_input = cruiser_input.to_s
            player_cruiser_array = cruiser_input.split(/\s*,\s*/)
            while player_board.valid_placement?(player_1_cruiser, player_cruiser_array) == false
                puts "These are invalid coordinates. Please try again."
                cruiser_input = gets.chomp
                cruiser_input = cruiser_input.to_s
                player_cruiser_array = cruiser_input.split(/\s*,\s*/)
                player_cruiser_array
            end
            player_board.place(player_1_cruiser, player_cruiser_array)
            player_board.render(true)

            puts "Enter the placement for your two-unit Submarine. Name cells using an uppercase letter and number, such as A3. Separate each coordinate with a comma."
            submarine_input = gets.chomp
            submarine_input = submarine_input.to_s
            player_submarine_array = submarine_input.split(/\s*,\s*/)
            while player_board.valid_placement?(player_1_submarine, player_submarine_array) == false
                puts "These are invalid coordinates. Please try again"
                submarine_input = gets.chomp
                submarine_input = submarine_input.to_s
                player_submarine_array = submarine_input.split(/\s*,\s*/)
                player_submarine_array
            end
            player_board.place(player_1_submarine, player_submarine_array)
            player_board.render(true)

        elsif usrin == "q"
        else 
            start
        end

    end


    def game_over?
        array_of_ships_player = []
        player_board.cells.keys.each do |cell|
            if player_board.cells[cell].render(true) == "S"
                array_of_ships_player << cell
                array_of_ships_player
            end
            array_of_ships_player
        end

        array_of_ships_computer = []
        comp_board.cells.keys.each do |cell|
            if comp_board.cells[cell].render(true) == "S"
                array_of_ships_computer << cell
                array_of_ships_computer
            end
            array_of_ships_computer
        end

        if array_of_ships_player == [] or array_of_ships_computer == []
            @game_over = true
            @game_over
        else
            @game_over = false
            @game_over
        end
    end

    def winner
        if @game_over == true
            array_of_ships_player = []
            player_board.cells.keys.each do |cell|
                if player_board.cells[cell].render(true) == "S"
                    array_of_ships_player << cell
                    array_of_ships_player
                end
                array_of_ships_player
            end

            array_of_ships_computer = []
            comp_board.cells.keys.each do |cell|
                if comp_board.cells[cell].render(true) == "S"
                    array_of_ships_computer << cell
                    array_of_ships_computer
                end
                array_of_ships_computer
            end

            if array_of_ships_player == [] and array_of_ships_computer == []
                winner = "Game over! We destroyed each other! No one wins!"
                p winner
                start
            elsif array_of_ships_player == []
                winner = "Game over! I win!"
                p winner
                start
            elsif array_of_ships_computer == []
                winner = "Game over! You win!"
                p winner
                start
            end

        end

    end


end