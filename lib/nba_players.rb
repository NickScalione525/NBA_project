require 'pry'

require_relative('../lib/api')


class Players 


    def initialize(response)
            response.each do |key, value|
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
            binding.pry
        end
    end
end
