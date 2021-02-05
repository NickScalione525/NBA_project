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

   
end

