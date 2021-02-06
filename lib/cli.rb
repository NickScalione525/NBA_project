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
        puts "Hello! I'm your host, Walt Clyde Frazier.  Let's get started.  What would you like to check out first?"
        self.prompt_selection
    end

        def prompt_selection
            puts "Please select from the following"
            puts "1. Team info"
            puts "2. Player info"
            puts "3. Player Stats"
            puts "4. Exit"
            input = gets.strip
             if input.downcase == "1" || "Team Info"
                self.knicks_info
            elsif input.downcase == "2" || "Player Info"
                self.player_queue
            elsif input.downcase == "3" || "Player stats"
                self.player_stats
            elsif input.downcase == "4" || "Exit"
                self.goodbye
            else
                # error handling
            
            end
                end


        def knicks_info
            puts "Bounding and Astounding, here is a look at your 2020-2021 NY Knicks."
            puts "--------------------------------------------------------------------"
                            
                                    Scraper.scrape_team_info
                                
            


            puts "-----------------------Where to next?-------------------------"
            puts "--------------------------------------------------------------"
            puts " 1. Player info "      " 2. Player stats   ""       " "3. Exit"
            puts "--------------------------------------------------------------"
            puts "--------------------------------------------------------------"
            input = gets.strip
            if input.downcase == "1" || "Player info"
                self.player_info
            elsif input.downcase == "2" || "Player stats"
                self.player_stats
            elsif input.downcase == "3" || "Exit"
                self.goodbye
            else
                # "error handling"
         end
        end

            def player_info
                puts " A precocious vet or an auspicious neophyte? Which Knick with the Knack will tickle your fancy?"
                puts "-----------------------------------------------------------------------------------------------"

                input = gets.strip
                # error handling
                if Scraper.roster.include?(input)
                    self.display player(input)
                    puts "Duping and hooping, what can I show you next?"
                    puts "1. Team info"
                    puts "2. Player stats"
                    puts "3. View another player"
                    puts "4. Exit"
                    input = gets.strip
                    if input == "1" || "Team info"
                        self.knicks_info
                    elsif input == "2" || "Player stats"
                        self.player_stats
                    elsif input == "3" || "View another player"
                        self.player_info
                    elsif input == "4" || "Exit"
                        self.goodbye
                    else
                        puts "A dubious call hexes and vexes. Let's try again."
                        self.prompt_selection
                end
            end
        end

                def player_stats
                    puts "Cruising and Bruising or Wheeling and Dealing?"
                    puts "Spinning and Winning or Weaving and Achieving?"
                    puts "       Which set of stats do you prefer? "
                    puts " 1. Tradiitional   -   2. Advanced    -  3. Exit"
                        input = gets.strip  
                    if input == "1" || "Traditional"
                        self.traditional_stats
                    elsif input == "2" || "Advanced"
                        self.advanced_stats
                    elsif input == "3" || "Exit"
                        self.goodbye
                    else
                        # error handling
                end
            end

                def traditional_stats
                    puts "Please enter the name of the Knick you would like to view"
                        input = gets.strip
                    if Player.all.include?(input)
                        # return traditional stat hash
                    else
                        puts "Who is that?"
                        self.player_stats
                    end
                end
                
                    def advanced_stats
                        puts "Please enter the name of the Knick you would like to view"
                            input = gets.strip
                        if Player.all.include?(input)
                            # return advanced stat hash
                        else
                            puts "Who is that?"
                            self.player_stats
                    end
                end




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