require 'pry'

require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'awesome_print'
require 'httparty'


class Api  

    @@url = "https://www.balldontlie.io/api/v1/teams/1"

    def self.get_teams
        response = HTTParty.get(@@url)
        response.each do |attribute, value|
            puts "#{attribute}: #{value}"
            Teams.new(response)
        end
    end

   
end

