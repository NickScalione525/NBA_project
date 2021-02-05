require 'pry'

require_relative('../lib/api')


class Team < Api
    attr_accessor :full_name, :city, :conference, :division
    
    @@all = []

    def initialize(team_hash)
        @team_hash.each do |key, value|
            self.send("#{key}=", value)
            @@all << self unless @@all.include? self
            @team_hash = @knicks_hash.merge(team_hash)
        end
    end

    def self.all
        @@all.uniq
        binding.pry
    end

end

