require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'

class Game
    attr_reader :comp_board, :player_board

    def initialize
        @comp_board = Board.new
        @player_board = Board.new
    end

end