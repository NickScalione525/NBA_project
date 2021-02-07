require 'terminal-table'
require_relative '../config/environment'



require 'pry'




class Team
    attr_accessor :team_name, :location, :overall_record, :playoff_apearences, :championships, :current_record, :coach, :executive, :pts_per_game, :opp_pts_per_game, :pace, :off_rtg, :def_rtg, :net_rtg

    
    
    @@all = []

    def initialize(*team_hash)
            team_hash.each do |key, value|
            self.send("#{key}=", value)
            @@all << self unless @@all.respond_to?("#{key}=")
            end
        end


    

        
    def self.all
        @@all
    end




end


