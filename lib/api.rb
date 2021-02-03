require 'pry'

require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'awesome_print'
require 'httparty'


class Api  

    @@url = "https://www.balldontlie.io/api/v1/teams/#{@input}"  

    def self.get_teams(input)
        response = HTTParty.get(@@url)
        response["data"].each do |team|
        Team.new(team)
        end
    end


   @@url2 = "https://www.balldontlie.io/api/v1/players?seasons[]=2020"

   def self.get_player
    response = HTTParty.get(@@url2)
    response.collect do |attribute, value|
        puts ["#{attribute}: #{value}"]
        Players.new(response)
    end
end

@@url3 = "https://www.balldontlie.io/api/v1/season_averages"

def self.get_stats
    response = HTTParty.get(@@url3)
    response.collect do |attribute, value|
        puts "#{attribute}: #{value}"
        
        Stats.new(response)
    end
end
end
   


