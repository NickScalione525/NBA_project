require 'pry'

require_relative('../lib/api')


class Teams  
    attr_accessor :city, :conference, :division, :full_name


    def initialize(response)
            response.each do |key, value|
            self.send(("#{key}="), value)
            binding.pry
        end
    end
end








