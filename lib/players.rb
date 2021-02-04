require 'pry'

require_relative('../lib/api')


class Players 
        

    def initialize(player_hash)
            player_hash.each do |key, value|
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
            binding.pry
        end
    end
end
