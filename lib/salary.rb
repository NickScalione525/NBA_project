require 'terminal-table'


class Salary

    @@all = []
        

    def initialize(salary_hash)
            salary_hash.each do |key, value|
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
            @@all << self unless @@all.include? self
        end
    end


    def self.all
        @@all
    end














end