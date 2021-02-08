require 'pry'
require 'terminal-table'




class Player 
  attr_accessor :name, :number, :position, :height, :weight, :birthdate, :nationality, :expierence, :college, :age, :games, :starts, :mpg, :fg, :fga, :fga, :fgperc, :threes_a_game, :threes_attempted, :three_percentage, :twos_a_game, :twos_attempted, :twos_percentage, :efg, :ft, :fta, :ft_percentage, :orb, :drb, :tb, :ast, :stl, :blk, :tov, :pf, :pts, :MP, :PER, :TS, :three_rate, :Ft, :ORB_percentage, :DRB_percentage, :tB_percentage, :AST_percentage, :STL_percentage, :BLK_percentage, :TOV_percentage, :USG, :OWS, :DWS, :WS, :WS_per_forty_eight, :OBPM, :DBPM, :BPM, :VORP

    @@all = []
        

    def initialize(player_hash)
            player_hash.each do |key, value|
            self.send(("#{key}="), value) if self.respond_to?("#{key}=") 
            end
          @@all << self     
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

   

    # def add_player_traditional_stats
    #     t_stats_hash = NbaStats::Scraper.new.traditional_player_stats(self)
    #     t_stats_hash.each do |key,value|
    #       self.send("#{key}=", value)
    #     end
    #   end

    #   def add_player_advanced_stats
    #     a_stats_hash = NbaStats::Scraper.new.additional_player_stats(self)
    #     a_stats_hash.each do |key,value|
    #       self.send("#{key}=", value)
    #     end
    #   end

   
end
