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


end

