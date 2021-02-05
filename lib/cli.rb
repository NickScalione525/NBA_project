require 'pry'
require 'net/http'
require 'awesome_print'
require 'nokogiri'
require 'open-uri'
require 'httparty'
require 'terminal-table'


require_relative('./api')
require_relative('./player')
require_relative('./team')
require_relative('./stats')
require_relative('./scraper')

class Cli  


    def welcome
        puts "Hello! I'm your host, Walt Clyde Frazier"
        end

        # def user_prompt
        # Method prompting the user to select between team info, player info, or player stats
        # end


        # def team_info  
        
        # displays all team info

        # prompts the user to choose between player info, player stats, exit  

        # end

        # def player_info

            # user enters in the name of a player and is given roster and salary info

            # prompt the user to select between another player, team info, player stats, exit.

        # end


        # def player_stats
        #     prompts the user to select between traditional or advanced

        # end

        # def traditional_stats
        #     ask for player name, returns stats

        #     prompt another player, team info, advanced stats, player info, exit

        # end

        # def advanced_stats

        #     ask for player name, returns stats

        #     prompt another player, team info, traditional stats, player info, exit

        # end

    end