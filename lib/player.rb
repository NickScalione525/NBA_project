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
    
    def self.find(input)
        @@all.find do |player|
            player.name.include?(input)
        end
    end
end

