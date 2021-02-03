require 'pry'

require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'awesome_print'
require 'httparty'


class Api  

    @@url = "https://www.balldontlie.io/api/v1/teams/#{@input}"  

    def self.get_teams(team)
        response = HTTParty.get(@@url)
        response.each do |attribute, value|
            puts "#{attribute}: #{value}"
            Teams.new(response)
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

   
end

