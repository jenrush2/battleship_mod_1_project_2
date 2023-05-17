require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'

class Turn
    attr_reader

    def initialize
        @