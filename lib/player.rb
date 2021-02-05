require 'pry'

require_relative('../lib/api')


class Player 

    @@all = []
        

    def initialize(player_hash)
            player_hash.each do |key, value|
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
            @@all << self unless @@all.include? self
            @@all
            binding.pry
        end
    end

    def self.create_player(player_array)
        player_array.each do |player|
            Player.new(player)
        end
    end

    def self.player_names
        @@all.map {|player| player.name}
      end

    
    def self.find(input)
        @@all.find do |player|
            player.name.downcase.include?(input.downcase)
        end
    end

    def player_salary(input)
end
end
