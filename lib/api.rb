require 'pry'

require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'awesome_print'
require 'httparty'


class Api  

    @@url = "https://www.balldontlie.io/api/v1/teams/20"  

    def self.get_team(input)
        response = HTTParty.get(@@url)
        response.each do |team|
        knicks_hash = {full_name: response["full_name"], city: response["city"], conference: response["conference"], division: response["division"]}
        Team.new(knicks_hash)
        end
    end


    
    @@url2 = "https://www.balldontlie.io/api/v1/players/@{input}"

   def self.get_player(input)
    response = HTTParty.get(@@url2)
    response["data"].each do |name|
        player_hash = {first_name: name["first_name"], last_name: name["last_name"], position: name["position"], height_feet: name["height_feet"], height_inches: name["height_inches"], weight_pounds: name["weight_pounds"], team: name["team"]["full_name"]}
        Player.new(player_hash)
        end
    end
end

   


