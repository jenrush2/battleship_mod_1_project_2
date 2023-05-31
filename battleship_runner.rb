require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require './lib/turn'

battleship_new_game = Game.new

battleship_new_game.start

while battleship_new_game.game_over? == false
    turn = Turn.new(battleship_new_game.comp_board, battleship_new_game.player_board)
    turn.display
    turn.player_shot
    turn.computer_shot
    turn.display_results
end

battleship_new_game.winner



