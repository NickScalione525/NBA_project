class Astats

    @@all = []


    def initialize(advanced_hash)
            advanced_hash.each do |key, value|
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
        end
    end

    def self.all
        @@all
    end