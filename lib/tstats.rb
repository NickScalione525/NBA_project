require 'pry'




class Tstats
  attr_accessor :name, :age, :games, :starts, :mpg, :fg, :fga, :fga, :fgperc, :threes_a_game, :threes_attempted, :three_percentage, :twos_a_game, :twos_attempted, :twos_percentage, :efg, :ft, :fta, :ft_percentage, :orb, :drb, :tb, :ast, :stl, :blk, :tov, :pf, :pts

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
