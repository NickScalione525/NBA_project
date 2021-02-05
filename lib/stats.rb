require 'pry'

require_relative('../lib/api')


class Stats < Scraper

    @@all = []


    def initialize(hash)
            hash.each do |key, value|
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
            binding.pry
        end
    end
end
