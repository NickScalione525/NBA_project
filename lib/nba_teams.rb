require 'pry'

require_relative('../lib/api')


class NBA_teams  
    attr_accessor :city, :conference, :division, :full_name

    def initialize(team_hash)
            team_hash.each do |key, value|
            self.send(("#{key}="), value)
            binding.pry
        end
    end
end








