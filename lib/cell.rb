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
        if empty? == false
            ship[0].hit
        end
    end

    def render
        if fired_upon? == true
            if empty? == false
                if ship[0].sunk? == false
                    p "H"
                else
                    p "X"
                end
            else
                p "M"
            end
        else
            p "."
        end
    end


    

end