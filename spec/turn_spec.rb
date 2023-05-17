require 'rspec'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

RSpec.describe Turn do
    it "exists" do
        turn = Turn.new

        expect(turn).to be_an_instance_of(Turn)
    end
    
end