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
        end
        
        #Split to just numbers so we can test consec
        split_number_array = []
        array_of_coordinates.each do |coord|
            split_number_array << coord[1]
            split_number_array
        end

        #Create boolean to check if numbers are consec
        check_if_split_number_is_consec = true
        if split_number_array != (split_number_array.min..split_number_array.max).to_a
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
        array_of_coordinates.each do |coord|
            split_letter_array << coord[0]
            split_letter_array
        end

        check_if_split_letter_is_consec = true
        if split_letter_array != (split_letter_array.min..split_letter_array.max).to_a
            #if all letters are the same let it pass
            if split_letter_array.uniq.size == 1
                check_if_split_letter_is_consec = true
            else
                check_if_split_letter_is_consec = false
            end

            check_if_split_letter_is_consec
        end



        if ship_name.length != array_of_coordinates.length
            false
        elsif check_for_valid_coord_boolean == false
            false
        elsif array_of_coordinates.sort != array_of_coordinates
            false
        elsif check_if_split_number_is_consec == false
            false
        elsif check_if_split_letter_is_consec == false
            false
        else
            true
        end
    end

end
