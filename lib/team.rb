require 'pry'

require_relative('../lib/api')


class Team
    attr_accessor :full_name, :city, :conference, :division

    @@all = []

    def initialize(team)
        team.each do |key, value|
            self.send("#{key}=", value) if self.respond_to?("#{key}=")
            end
            @@all << self unless @@all.include?(self)
            binding.pry
    end
end

def self.all
    @@all
end











