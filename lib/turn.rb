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


end

