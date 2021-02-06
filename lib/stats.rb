require 'pry'




class Stats

    @@all = []


    def initialize(hash)
            hash.each do |key, value|
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
        end
    end

    def player_stats_traditional
        traditional_hash = Scraper.new.traditional_player_stats(self)
        traditional_hash.each do |key,value|
          self.send("#{key}=", value)
        end
      end
    
    def player_stats_advanced
        advanced_hash = Scraper.new.advanced_player_stats(self)
        advanced_hash.each do |key,value|
          self.send("#{key}=", value)
        end
      end
end
