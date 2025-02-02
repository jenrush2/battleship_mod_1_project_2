require 'pry'

class Ship
    attr_accessor :name, :length, :health

    def initialize(name, length)
        @name = name
        @length = length
        @health = length
    end

    def sunk?
        health <= 0
    end

    def hit
        @health -= 1
    end


end
