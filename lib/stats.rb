require 'pry'

require_relative('../lib/api')


class Stats

    @@all = []


    def initialize(hash)
            hash.each do |key, value|
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
            binding.pry
        end
    end

    def add_player_stats_traditional
        traditional_hash = Scraper.new.player_stats(self)
        traditional_hash.each do |key,value|
          self.send("#{key}=", value)
        end
      end
    
    def add_player_stats_advanced
        advanced_hash = Scraper.new.advanced_stats(self)
        advanced_hash.each do |key,value|
          self.send("#{key}=", value)
        end
      end
end
