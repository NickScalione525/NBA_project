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
        binding.pry
    end

   
end

