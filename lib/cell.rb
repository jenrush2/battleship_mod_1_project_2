require 'pry'
require './ship'

class Cell
    attr_reader :coordinate, :ship, :attacked

    def initialize(coordinate)
        @coordinate = coordinate
        @ship = []
        @attacked = false
    end

    def empty?
        if ship == []
            true
        else
            false
        end
    end

    def place_ship(new_ship)
        ship << new_ship
        return ship
    end

    def fired_upon?
        if attacked == false
            false
        else
            true
        end
    end

    def fire_upon
        @attacked = true
        if ship.empty? == false
            ship[0].hit
        end
    end


    

end