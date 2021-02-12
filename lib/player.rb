require 'pry'
require 'terminal-table'




class Player 
  attr_accessor :name, :number, :position, :height, :weight, :birthdate, :nationality, :experience, :college, :age, :games, :starts, :mpg, :fg, :fga, :fga, :fgperc, :threes_a_game, :threes_attempted, :three_percentage, :twos_a_game, :twos_attempted, :twos_percentage, :efg, :ft, :fta, :ft_percentage, :orb, :drb, :trb, :ast, :stl, :blk, :tov, :pf, :pts, :mp, :per, :ts, :three_rate, :ft, :orb_percentage, :drb_percentage, :tb_percentage, :ast_percentage, :stl_percentage, :blk_percentage, :tov_percentage, :usg, :ows, :dws, :ws, :ws_per_forty_eight, :obpm, :dbpm, :bpm, :vorp, :salary

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

    def self.find_by_name(input)
      @@all.find do |input|
          player.name.include?(input.downcase)
      end
  end
   
end
