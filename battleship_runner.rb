require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

battleship_new_game = Game.new

battleship_new_game.start
