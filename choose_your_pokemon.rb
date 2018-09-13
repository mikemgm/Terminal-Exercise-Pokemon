require 'faker'
require 'espeak'

class Pokemon
    attr_accessor :name, :location, :move

    def initialize 
        welcome_message
    end

    def welcome_message
        puts "Welcome to Prof. Oak's lab!"
        puts "In front of me are 3 pokeballs."
        puts "Pokeballs hold Pokemon in them."
        puts "You will use these to battle and conquer the world of Pokemon."
        "Gotta catch 'em all!!!"
        poke_ball
    end

    def poke_ball  
        puts "#######   #######   #######"
        puts "#  1  #   #  2  #   #  3  #"
        puts "#######   #######   #######"
        choose_ball 
    end 

    def choose_ball 
        puts "Chose your Pokemon!"
        pokemon_type = gets.chomp 
        if pokemon_type == "1" || pokemon_type == "2" || pokemon_type == "3"
            @name = Faker::Pokemon.name 
        else 
            puts "Invalid Selection, choose 1,2,3"
            choose_ball 
        end
        puts "Congratulations! Your Pokemon is #{@name}!" 
        speech_poke = ESpeak::Speech.new("Congratulations! Your Pokemon is #{@name}")
        speech_poke.speak    
        gym_location
        location 
    end 

    def gym_location 
        puts "Fella! Are you ready for a battle?!"
        battle = gets.chomp.downcase
        @location = Faker::Pokemon.location
        if battle == 'yes'
            puts "Your next gym battle will be in: #{@location}" 
        elsif battle == 'no'
            puts "I'll ask you again. "
            sleep(2)
            gym_location
        else
            puts "Invalid input. 'yes' or 'no' please"
            sleep(2)
            gym_location
        end
        speech_location = ESpeak::Speech.new("Your next gym battle will be in: #{location}")
        speech_location.speak 
        pokemon_move
    end 

    def pokemon_move 
        puts "Training is the key to become an all time Pokemon Master!" 
        puts "Trainer! Have you been training hard?"
        training = gets.chomp 
        @move = Faker::Pokemon.move
        if training == 'yes'
            puts "Excellent! Your pokemon's first move is: #{@move}"
            speech_move = ESpeak::Speech.new("Your pokemon's first move is: #{@move}")
        else
            puts "Whaterver, I don't have time for this. Your pokemon's first move is: #{@move}"
            speech_move = ESpeak::Speech.new("Whaterver, I don't have time for this. Your pokemon's first move is: #{@move}")
        end
        speech_move.speak 
        battle
    end    

    def battle 
        gary_pokemon = Faker::Pokemon.name
        pokemon2 = Faker::Pokemon.name
        text = "Welcome to the #{@location} gym! 
        You will battle Gary
        Get ready for battle!
        Gary chooses #{gary_pokemon}!
        Trainer do you choose #{@name} or #{pokemon2}?"
            
        puts text

        decision = gets.chomp.downcase
        if decision == pokemon2.downcase 
            @name = pokemon2 
        end
        puts "You chose #{@name}!"
        speech_location = ESpeak::Speech.new(text + "You chose #{@name}!")
        speech_location.speak 


    end


end



pikachu = Pokemon.new
