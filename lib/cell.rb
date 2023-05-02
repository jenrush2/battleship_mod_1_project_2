require 'pry'
require './ship'

class Cell
    attr_reader :coordinate

    def initialize(coordinate)
        @coordinate = coordinate
    end
    
end