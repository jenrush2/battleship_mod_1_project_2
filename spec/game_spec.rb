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
