require 'pry'
require 'net/http'
require 'nokogiri'
require 'open-uri'
require 'terminal-table'

require_relative('./player')
require_relative('./team')
require_relative('./stats')
require_relative('./scraper')
require_relative('./salary')

class Cli  


    def welcome
        puts "Hello! I'm your host, Walt Clyde Frazier.  Let's get started.  What would you like to check out first?"
        self.prompt_selection
    end

        def prompt_selection
            puts "Please select from the following"
            puts "1. Team info"
            puts "2. Player info"
            puts "3. Player stats"
            puts "4. Exit"
            input = gets.strip
             if ["1", "Team info"].include?(input.downcase)
                self.knicks_info
            elsif ["2", "Player info"].include?(input.downcase)
                self.player_info
            elsif ["3", "Player stats"].include?(input.downcase) 
                self.player_stats
            elsif ["4", "Exit"].include?(input.downcase)
                self.goodbye
            else
                if ["1", "Team info", "2", "Player info", "3", "Player stats", "4", "Exit"].include?(input.downcase)
                puts "Hexing and Vexing, that was a dubious selection.  Please try again."
                self.prompt_selection
            
            end
                end
            end

        def knicks_info
            puts "Bounding and Astounding, here is a look at your 2020-2021 NY Knicks."
            puts "--------------------------------------------------------------------"
                            
                        self.display_team_info
                         
            


            puts "-----------------------Where to next?-------------------------"
            puts "--------------------------------------------------------------"
            puts " 1. Player info "      " 2. Player stats   ""       " "3. Exit"
            puts "--------------------------------------------------------------"
            puts "--------------------------------------------------------------"
            input = gets.strip
            if ["1", "Player info"].include?(input.downcase)
                self.knicks_info
            elsif ["2", "Player stats"].include?(input.downcase)
                self.player_info
            elsif ["3", "Exit"].include?(input.downcase) 
                self.player_stats
            elsif ["4", "Exit"].include?(input.downcase)
                self.goodbye
            else
                if ["1", "Team info", "2", "Player info", "3", "Player stats", "4", "Exit"].include?(input.downcase)
                puts "Hexing and Vexing, that was a dubious selection.  Please try again."
                self.prompt_selection
                end
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
                    if ["1", "Team info"].include?(input.downcase)
                        self.knicks_info
                    elsif ["2", "Player info"].include?(input.downcase)
                        self.player_info
                    elsif ["3", "Player stats"].include?(input.downcase) 
                        self.player_stats
                    elsif ["4", "Exit"].include?(input.downcase)
                        self.goodbye
                    else
                        if ["1", "Team info", "2", "Player info", "3", "Player stats", "4", "Exit"].include?(input.downcase)
                        puts "Hexing and Vexing, that was a dubious selection.  Please try again."
                        self.prompt_selection
                        end
                end
            end
        

            def display_player(input)
                Scraper.new.roster(input)
                puts Terminal::Table.new rows: Player.rows
            end

                def player_stats
                    puts "Cruising and Bruising or Wheeling and Dealing?"
                    puts "Spinning and Winning or Weaving and Achieving?"
                    puts "       Which set of stats do you prefer? "
                    puts " 1. Tradiitional   -   2. Advanced    -  3. Exit"
                        input = gets.strip  
                        if ["1", "Traditional"].include?(input.downcase)
                            self.knicks_info
                        elsif ["2", "Advanced"].include?(input.downcase)
                            self.player_info
                        elsif ["3", "Exit"].include?(input.downcase) 
                            self.goodbye
                        else
                            if ["1", "Team info", "2", "Player info", "3", "Player stats", "4", "Exit"].include?(input.downcase)
                            puts "Hexing and Vexing, that was a dubious selection.  Please try again."
                            self.player_stats
                    end
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




                def display_team_info(team_hash)
                    team_table = Terminal::Table.new do
                        Team.rows = rows
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

            end
        
    end