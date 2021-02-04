require 'pry'

require_relative('../lib/api')


class Team
    
    @@all = []

    def initialize(team_hash)
        team_hash.collect do |key, value|
            self.class.attr_accessor(key)
            self.send("#{key}=", value)
            @@all << self unless @@all.include? self
       
        end
      Team.all
    end

    def self.all
        @@all
        binding.pry
    end

end