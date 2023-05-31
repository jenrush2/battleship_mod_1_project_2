require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'

class Turn
    attr_reader :computer_board, :player_board, :player_turn_result, :computer_turn_result

    def initialize(computer_board, player_board)
        @computer_board = computer_board
        @player_board = player_board
        @player_turn_result = ""
        @computer_turn_result = ""
    end

    def display
        p "===============COMPUTER BOARD==============="
        computer_board.render
        p "===============PLAYER BOARD==============="
        player_board.render(true)
    end

    def player_shot
        p "It is your turn to take a shot. Type one coordinate to fire on."
        shot_coordinate = gets.chomp
        while computer_board.valid_coordinate?(shot_coordinate) == false
            p "That is not a valid shot. Please try again."
            shot_coordinate = gets.chomp
        end
            
        
        coord = computer_board.cells[shot_coordinate]
        if coord.fired_upon? == true
            if coord.render(true) == "H"
                previous_result = "hit."
            elsif coord.render(true) == "M"
                previous_result = "miss."
            elsif coord.render(true) == "X"
                previous_result = "hit. You already sunk the #{coord.ship[0].name}."
            end
            @player_turn_result = "You've fired on #{coord.coordinate} before. It was already a #{previous_result} Way to waste a turn."
        else 
            coord.fire_upon
            if coord.render(true) == "H"
                @player_turn_result = "Your shot on #{coord.coordinate} was a hit!"
            elsif coord.render(true) == "M"
                @player_turn_result = "Your shot on #{coord.coordinate} was a miss!"
            elsif coord.render(true) == "X"
                @player_turn_result = "Your shot on #{coord.coordinate} was a hit! You sunk the #{coord.ship[0].name}!"
            end
        return @player_turn_result

        end

        @player_turn_result
        
    end

    def computer_shot
        array_of_board_coordinates = player_board.cells.keys
        
        #create an array of coordinates that have been hit
        array_of_hits = []
        array_of_board_coordinates.each do |cell|
            if player_board.cells[cell].render == "H"
                array_of_hits << cell
                array_of_hits
            end
            array_of_hits
        end

        #If there have been hits, create a list of smart shots
        if array_of_hits != [] 
            array_of_smart_guess_options = []
            array_of_smart_guess_options_on_board = []
            
            #There are four smart shots for each hit that's in the middle of the board
            array_of_hits.each do |cell|
                letter_split_as_number = cell[0].ord
                letter_above = letter_split_as_number + 1
                letter_below = letter_split_as_number - 1
                smart_guess_1 = "#{letter_above.chr}#{cell[1]}"
                smart_guess_2 = "#{letter_below.chr}#{cell[1]}"

                number_split = cell[1].to_i
                number_above = number_split + 1
                number_below = number_split - 1
                smart_guess_3 = "#{cell[0]}#{number_above}"
                smart_guess_4 = "#{cell[0]}#{number_below}"

                array_of_smart_guess_options << [smart_guess_1, smart_guess_2, smart_guess_3, smart_guess_4]
                array_of_smart_guess_options = array_of_smart_guess_options.flatten

                #If the hit was on the edge of the baord, then we can't use all four coordinates
                #Only use smart shots if they're on the board AND have not already been fired on
                array_of_smart_guess_options.each do |coord|
                    if player_board.cells.key?(coord) == true and player_board.cells[coord].fired_upon? == false
                        array_of_smart_guess_options_on_board << coord
                        array_of_smart_guess_options_on_board
                    end
    
                    array_of_smart_guess_options_on_board
                end

                array_of_smart_guess_options_on_board
            end

            #Randomly choose from arary of smart shots
            computer_smart_guess = array_of_smart_guess_options_on_board.sample(1)
            
            #Turn the string representing the coordinate into a Cell object
            computer_smart_guess = player_board.cells[computer_smart_guess[0]]

            computer_smart_guess
        
        #If there have been no hits, just pick a random coordinate from the board
        else
            computer_smart_guess = array_of_board_coordinates.sample(1)
            
            #check to make sure smart guess has not already been used
            while player_board.cells[computer_smart_guess[0]].fired_upon? == true
                computer_smart_guess = array_of_board_coordinates.sample(1)
            end
            computer_smart_guess = player_board.cells[computer_smart_guess[0]]
            computer_smart_guess
        end

        #Fire on the smart guess and generate the result
        computer_smart_guess.fire_upon
        if computer_smart_guess.render(true) == "H"
            @computer_turn_result = "My shot on #{computer_smart_guess.coordinate} was a hit!"
        elsif computer_smart_guess.render(true) == "M"
            @computer_turn_result = "My shot on #{computer_smart_guess.coordinate} was a miss!"
        elsif computer_smart_guess.render(true) == "X"
            @computer_turn_result = "My shot on #{computer_smart_guess.coordinate} was a hit! I sunk your #{computer_smart_guess.ship[0].name}!"
        end

        @computer_turn_result
    end


    def display_results
        p @computer_turn_result
        p @player_turn_result
    end

            



end

