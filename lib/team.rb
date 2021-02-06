require 'terminal-table'
require_relative '../config/environment'



require 'pry'




class Team
    
    
    @@all = []

    def initialize(team_hash)
            team_hash.each do |key, value|
            self.class.attr_accessor(key)
            self.send("#{key}=", value)
            @@all << self unless @@all.include? self
        end
    
    end
    def self.all
        @@all
    end

    def rows
        row1 = [team_hash.keys]
        row2 << [team_hash.values]
        binding.pry
    end




end


