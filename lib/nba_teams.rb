require 'pry'

require_relative('../lib/api')


class Teams  


    def initialize(team_hash)
            team_hash.each do |key, value|
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
            binding.pry
        end
    end
end








