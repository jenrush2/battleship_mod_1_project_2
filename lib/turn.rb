require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'

class Turn
    attr_reader :computer_board, :player_board

    def initialize(computer_board, player_board)
        @computer_board = computer_board
        @player_board = player_board
    end

    def display
        p "===============COMPUTER BOARD==============="
        computer_board.render
        p "===============PLAYER BOARD==============="
        player_board.render(true)
    end

    def player_shot(shot_coordinate)
        coord = computer_board.cells[shot_coordinate]

        if computer_board.valid_coordinate?(coord.coordinate) == false
            p "That is not a valid shot. Please try again."
        else
            if coord.fired_upon? == true
                turn_result = "You've fired on #{coord.coordinate} before. It was already a #{coord.render(true)}. Way to waste a turn."
            else 
                coord.fire_upon
                if coord.render(true) == "H"
                    turn_result = "Your shot on #{coord.coordinate} was a hit!"
                elsif coord.render(true) == "M"
                    turn_result = "Your shot on #{coord.coordinate} was a miss!"
                elsif coord.render(true) == "X"
                    turn_result = "Your shot on #{coord.coordinate} was a hit! You sunk the #{coord.ship[0].name}!"
                end
            p turn_result
            return turn_result
            end
            turn_result
        end
    end

    def computer_shot
        array_of_board_coordinates = player_board.cells.keys
        
        array_of_hits = []
        array_of_board_coordinates.each do |cell|
            if player_board.cells[cell].render == "H"
                array_of_hits << cell
                array_of_hits
            end
            array_of_hits
        end

        if array_of_hits != [] 
            array_of_smart_guess_options = []
            array_of_smart_guess_options_on_board = []
            array_of_hits.each do |cell|
                letter_split_as_number = cell[0].ord
                letter_above = letter_split_as_number + 1
                letter_below = letter_split_as_number - 1
                smart_guess_1 = "#{letter_above.chr}#{cell[1]}"
                smart_guess_2 = "#{letter_below.chr}#{cell[1]}"

                number_split = cell[1].to_i
                number_above = number_split + 1
                number_below = number_split - 1
                smart_guess_3 = "#{cell[0]}#{number_above}"
                smart_guess_4 = "#{cell[0]}#{number_below}"

                array_of_smart_guess_options << [smart_guess_1, smart_guess_2, smart_guess_3, smart_guess_4]
                array_of_smart_guess_options = array_of_smart_guess_options.flatten


                array_of_smart_guess_options.each do |coord|
                    if player_board.cells.key?(coord) == true and player_board.cells[coord].fired_upon? == false
                        array_of_smart_guess_options_on_board << coord
                        array_of_smart_guess_options_on_board
                    end
                    p "line 82 #{array_of_smart_guess_options_on_board}"
                    array_of_smart_guess_options_on_board
                end
                p "line 85 #{array_of_smart_guess_options_on_board}"

                array_of_smart_guess_options_on_board
            end
            p "line 89 #{array_of_smart_guess_options_on_board}"

            computer_smart_guess = array_of_smart_guess_options_on_board.sample(1)
            p "line 92 #{computer_smart_guess}"
            computer_smart_guess = player_board.cells[computer_smart_guess[0]]
            p "line 94 #{computer_smart_guess}"

            computer_smart_guess
        else
            computer_smart_guess = array_of_board_coordinates.sample(1)
            p "line 99 #{computer_smart_guess}"
            computer_smart_guess = player_board.cells[computer_smart_guess[0]]
            p "line 101 #{computer_smart_guess}"
            computer_smart_guess
        end

        computer_smart_guess.fire_upon
        if computer_smart_guess.render(true) == "H"
            turn_result = "My shot on #{computer_smart_guess.coordinate} was a hit!"
        elsif computer_smart_guess.render(true) == "M"
            turn_result = "My shot on #{computer_smart_guess.coordinate} was a miss!"
        elsif computer_smart_guess.render(true) == "X"
            turn_result = "My shot on #{computer_smart_guess.coordinate} was a hit! I sunk your #{computer_smart_guess.ship[0].name}!"
        end
        
        p turn_result
        



        turn_result


    end
            



end

