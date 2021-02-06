require 'pry'

require_relative('../lib/api')


class Team
    
    
    @@all = []

    def initialize(team_hash) 
           team_hash.each do |key, value|
            self.class.attr_accessor(key)
            self.send("#{key}=", value)
            @@all << self unless @@all.include? self
            Team.all
        end
    end

    def self.all
        @@all
        binding.pry
    end

    def display_team_info
        knicks_hash = team_hash.merge(knicks_hash)
    end

end

