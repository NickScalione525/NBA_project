require 'pry'

require_relative('../lib/api')


class Team < Api
    attr_accessor :full_name, :city, :conference, :division
    
    @@all = []

    def initialize(team_hash)
        team_hash.each do |key, value|
            self.send("#{key}=", value)
            @@all << self unless @@all.include? self
        end
    end

    def self.all
        @@all
        binding.pry
    end

    def hash_merger
        knicks_hash = team_hash.merge(knicks_hash)
    end

end

