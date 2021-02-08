class Astats
    attr_accessor :name, :age, :games

    @@all = []


    def initialize(advanced_hash)
            advanced_hash.each do |key, value|
            self.send(("#{key}="), value)
            Cli.new.astats_display(advanced_hash)
        end
    end

    def self.all
        @@all
    end

end