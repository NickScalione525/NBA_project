require 'pry'
require 'terminal-table'




class Player 

    @@all = []
        

    def initialize(player_hash)
            player_hash.each do |key, value|
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
            @@all << self unless @@all.include? self
            @@all
        end
    end

    def self.all
        @@all
    end

    def self.create_player(player_array)
        player_array.each do |player|
            Player.new(player)
        end
    end

    def self.player_names
        @@all.map {|player| player.name}
      end

    
    def self.find_by_name(input)
        @@all.find do |input|
            player.name.downcase.include?(input.downcase)
        end
    end

    def self.rows
        rows = [player_hash.keys]
        rows << [player_hash.values]
    end

   
end
