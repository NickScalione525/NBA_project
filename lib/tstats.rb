require 'pry'




class Tstats

    @@all = []


    def initialize(traditional_hash)
            traditional_hash.each do |key, value|
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
        end
    end

    def self.all
      @@all
    end
end
