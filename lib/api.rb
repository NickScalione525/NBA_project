require 'pry'

require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'awesome_print'
require 'httparty'


class Api  

    @@url = "https://www.balldontlie.io/api/v1/teams"

    def self.get_teams
        response = HTTParty.get(@@url)
        team_hash = {name: response["full_name"], city: response["city"], conference: response["conference"], division: response["division"]}
        Teams.new(team_hash)
        binding.pry
    end

   
end

