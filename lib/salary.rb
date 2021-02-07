require_relative '../config/environment'


class Salary
    attr_accessor :player_name, :player_salary

    @@all = []
        

    def initialize(salary_hash)
            salary_hash.each do |key, value|
            self.send(("#{key}="), value)
            @@all << self unless @@all.respond_to?("#{key}=")
        end
    end


    def self.create_player_salary(salary_array)
        salary_array.each do |salary_hash|
            Salary.new(salary_hash)
        end
    end

    def self.all
        @@all.uniq
    end

end