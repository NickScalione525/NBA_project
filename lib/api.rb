require 'pry'

require 'uri'
require 'net/http'
require 'openssl'
require 'json'


class Api  

    URL = "https://www.balldontlie.io/api/v1/teams"

    def get_teams
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        response.body
    end

    def basketball_teams
        response = JSON.parse(self.get_teams)
        response[1]
        binding.pry
    end
end
teams = Api.new
puts teams.basketball_teams.uniq
