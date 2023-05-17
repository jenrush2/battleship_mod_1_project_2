require 'pry'
require './lib/ship'
require './lib/cell'

class Board
    attr_reader :cells

    def initialize
        @cells = {"A1" => Cell.new("A1"), "A2" => Cell.new("A2"),
                 "A3" => Cell.new("A3"), "A4" => Cell.new("A4"),
                 "B1" => Cell.new("B1"), "B2" => Cell.new("B2"),
                 "B3" => Cell.new("B3"), "B4" => Cell.new("B4"),
                 "C1" => Cell.new("C1"), "C2" => Cell.new("C2"),
                 "C3" => Cell.new("C3"), "C4" => Cell.new("C4"),
                 "D1" => Cell.new("D1"), "D2" => Cell.new("D2"),
                 "D3" => Cell.new("D3"), "D4" => Cell.new("D4")}
    end

    def valid_coordinate?(test_coordinate)
        if cells.key?(test_coordinate) == true
            true
        else
            false
        end
    end

    def valid_placement?(ship_name, array_of_coordinates)
        
        #Check to make sure each coordinate is on the board
        check_for_valid_coord_boolean = true
        array_of_coordinates.each do |coord|
            if cells.key?(coord) == false
               check_for_valid_coord_boolean = false
               check_for_valid_coord_boolean
            end
            check_for_valid_coord_boolean
        end
        
        p "for #{array_of_coordinates} the value of check for valid coord is #{check_for_valid_coord_boolean}"

        #Split to just numbers so we can test consec
        split_number_array = []
        #only do next part if coordinates are on the board
        if check_for_valid_coord_boolean == true
            array_of_coordinates.each do |coord|
                split_number_array << coord[1]
                split_number_array
            end
            split_number_array
        end

        #Create boolean to check if numbers are consec
        check_if_split_number_is_consec = true
        if check_for_valid_coord_boolean == true and split_number_array != (split_number_array.min..split_number_array.max).to_a
            #if all numbers are the same let it pass -- will test letters in another block
            if split_number_array.uniq.size == 1
                check_if_split_number_is_consec = true
            else
                check_if_split_number_is_consec = false
            end
        
            check_if_split_number_is_consec
        end

        #Split to just letters so we can test consec
        split_letter_array = []
        #Only do next part if coordinates are on the board
        if check_for_valid_coord_boolean == true
            array_of_coordinates.each do |coord|
                split_letter_array << coord[0]
                split_letter_array
            end
            split_letter_array
        end

        #create boolean to check if letters are consec
        check_if_split_letter_is_consec = true
        if check_for_valid_coord_boolean == true and split_letter_array != (split_letter_array.min..split_letter_array.max).to_a
            #if all letters are the same let it pass
            if split_letter_array.uniq.size == 1
                check_if_split_letter_is_consec = true
            else
                check_if_split_letter_is_consec = false
            end

            check_if_split_letter_is_consec
        end

        

        #test rules from above
        #Check that coordinates are on the board
        if check_for_valid_coord_boolean == false
            false
        #number of coordinates should be the same as length of ship
        elsif ship_name.length != array_of_coordinates.length
            false
        #coordinates should be increasing consecutive
        elsif array_of_coordinates.sort != array_of_coordinates
            false
        #numbers must be consecutive if not all the same
        elsif check_if_split_number_is_consec == false
            false
        #letters should be consecutive if not all the same
        elsif check_if_split_letter_is_consec == false
            false
        #coordinates can't be diagonal
        elsif split_letter_array == (split_letter_array.min..split_letter_array.max).to_a and split_number_array == (split_number_array.min..split_number_array.max).to_a
            false
        #coordinates can't repeat
        elsif array_of_coordinates.uniq.size != array_of_coordinates.size
            false
        #check to see if any of the cells already have a ship
        else
            array_of_boolean_results = []
            array_of_coordinates.each do |coord|
                if cells[coord].ship != []
                    array_of_boolean_results << false
                else 
                    array_of_boolean_results << true
                end
                array_of_boolean_results
            end 
            if array_of_boolean_results.include?(false) == true
                result = false
            else
                result = true
            end 
            result
        end
    end

    def place(ship_name, coordinates_to_place)
        if valid_placement?(ship_name, coordinates_to_place) == false
            p "Those were not valid placements for your ship. Try again."
        else
            coordinates_to_place.each do |coord|
                cells[coord].place_ship(ship_name)
            end
        end
    end

    def render(*show_hidden_ship)
        if show_hidden_ship != [true]
            puts "Current board: \n"+
                "_____________________\n"+
                "|   | 1 | 2 | 3 | 4 |\n"+
                "_____________________\n"+
                "| A | #{cells["A1"].render} | #{cells["A2"].render} | #{cells["A3"].render} | #{cells["A4"].render} |\n"+
                "_____________________\n"+
                "| B | #{cells["B1"].render} | #{cells["B2"].render} | #{cells["B3"].render} | #{cells["B4"].render} |\n"+
                "_____________________\n"+
                "| C | #{cells["C1"].render} | #{cells["C2"].render} | #{cells["C3"].render} | #{cells["C4"].render} |\n"+
                "_____________________\n"+
                "| D | #{cells["D1"].render} | #{cells["D2"].render} | #{cells["D3"].render} | #{cells["D4"].render} |\n"+
                "_____________________\n"
        else
            puts "Board with ships (cheat): \n"+
            "_____________________\n"+
            "|   | 1 | 2 | 3 | 4 |\n"+
            "_____________________\n"+
            "| A | #{cells["A1"].render(true)} | #{cells["A2"].render(true)} | #{cells["A3"].render(true)} | #{cells["A4"].render(true)} |\n"+
            "_____________________\n"+
            "| B | #{cells["B1"].render(true)} | #{cells["B2"].render(true)} | #{cells["B3"].render(true)} | #{cells["B4"].render(true)} |\n"+
            "_____________________\n"+
            "| C | #{cells["C1"].render(true)} | #{cells["C2"].render(true)} | #{cells["C3"].render(true)} | #{cells["C4"].render(true)} |\n"+
            "_____________________\n"+
            "| D | #{cells["D1"].render(true)} | #{cells["D2"].render(true)} | #{cells["D3"].render(true)} | #{cells["D4"].render(true)} |\n"+
            "_____________________\n"
        end
    end
end
