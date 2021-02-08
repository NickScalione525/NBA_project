require 'pry'




class Tstats
  attr_accessor :name

  @@all = []


    def initialize(traditional_hash)
            traditional_hash.each do |key, value|
            self.send(("#{key}="), value)
            Cli.new.tstats_display(traditional_hash)
        end
    end

    def self.all
      @@all
    end
end
