require 'pry'
require 'terminal-table'




class Player 
  attr_accessor :name, :number, :position, :height, :weight, :birthdate, :nationality, :expierence, :college

    @@all = []
        

    def initialize(player_hash)
            player_hash.each do |key, value|
            self.send(("#{key}="), value)
            @@all << self unless @@all.respond_to?("#{key}=")
            Cli.new.player_info(player_hash)
            end
            
    end

    def self.all
        @@all
    end

    def self.create_player(player_array)
        player_array.each do |player_hash|
            Player.new(player)
        end
    end

    def self.player_names
        @@all.map {|player| player.name}
      end

    
    def self.find_by_name(input)
        @@all.find do |input|
            player.name.include?(input.downcase)
        end
    end

    def self.rows
        rows = [player_hash.keys]
        rows << [player_hash.values]
    end

    def add_player_traditional_stats
        t_stats_hash = NbaStats::Scraper.new.traditional_player_stats(self)
        t_stats_hash.each do |key,value|
          self.send("#{key}=", value)
        end
      end

      def add_player_advanced_stats
        a_stats_hash = NbaStats::Scraper.new.additional_player_stats(self)
        a_stats_hash.each do |key,value|
          self.send("#{key}=", value)
        end
      end

   
end
