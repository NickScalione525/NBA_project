
require_relative('../config/environment')


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
        puts "4. Player salary"
        puts "5. Exit"
        input = gets.strip
        if ["1", "Team info"].include?(input)
            knicks = Scraper.new.scrape_team_info
            self.knicks_info(knicks)
        elsif ["2", "Player info"].include?(input)
            new_knick = Scraper.new.roster(new_knick)
            self.player_info_prompt(new_knick)
        elsif ["3", "Player stats"].include?(input)
            tstats = Scraper.new.traditional_player_stats
            astats = Scraper.new.additional_player_stats
            self.player_stats
        elsif ["4", "Player salary"].include?(input)
            new_salary = Scraper.new.player_salaries
            self.player_salary
        elsif ["5", "Exit"].include?(input)
            self.goodbye
        else
            puts "Hexing and Vexing, that was a dubious selection.  Please try again."
                self.prompt_selection
         end
    end

        def knicks_info(team_hash)
        puts "Bounding and Astounding, here is a look at your 2020-2021 NY Knicks."
        puts "--------------------------------------------------------------------"
                puts "The #{team_hash[:team_name]} play in #{team_hash[:location]}." 
                puts " "
                puts "Coached by #{team_hash[:coach]} with #{team_hash[:executive]} running the Front Office"
                puts " "
                puts "the #{team_hash[:team_name]} currently have a record of #{team_hash[:current_record]}."
                puts " "
                puts "Overall, they have a #{team_hash[:overall_record]} overall record since their inception"
                puts " "
                puts "with #{team_hash[:playoff_apearences]} playoff appeareances and #{team_hash[:championships]} championships."
                puts " "
                puts "Their offense currently generates #{team_hash[:pts_per_game]} points per game"
                puts " "
                puts "while their defense holds teams to #{team_hash[:opp_pts_per_game]} points per game."
                puts " "
                puts "The Knicks pace of play is #{team_hash[:pace]} and their Off/Def/Net ratings are as follows"
                puts " "
                puts "Offensive rating = #{team_hash[:off_rtg]}, Defensive rating = #{team_hash[:def_rtg]} and"
                puts " "
                puts "Net rating = #{team_hash[:net_rtg]}."
                puts " "
                   

        puts "-------------------------Where to next?----------------------------------"
        puts "-------------------------------------------------------------------------"
        puts " 1. Player info "   " 2. Player stats "   "3. Player salary  "   "4. Exit"
        puts "-------------------------------------------------------------------------"
        puts "-------------------------------------------------------------------------"
        input = gets.strip
        if ["1", "Player info"].include?(input)
            Scraper.new.roster(input)
            self.player_info_prompt(input)
        elsif ["2", "Player stats"].include?(input)
            self.player_stats
        elsif ["3", "Player salary"].include?(input) 
            self.player_salary
        elsif ["4", "Exit"].include?(input)
            self.goodbye
        else
            if ["1", "Team info", "2", "Player info", "3", "Player stats", "4", "Exit"].include?(input)
            puts "Hexing and Vexing, that was a dubious selection.  Please try again."
            self.prompt_selection
        end
    end
    end

        def player_info_prompt(input)
            puts " A precocious vet or an auspicious neophyte? Which Knick with the Knack will tickle your fancy?"
            puts "-----------------------------------------------------------------------------------------------"
            puts "Julius Randle, RJ Barrett, Frank Ntilikina, Immanuel Quickley, Austin Rivers, Obi Toppin, Alec Burks"
            puts " "
            puts "Mitchell Robinson, Reggie Bullock, Ignas Brazdeikis, Nerlens Noel, Taj Gibson, Elrid Payton"
            puts " "
            puts "Theo Pinson, Dennis Smith Jr, Jared Harper, Kevin Knox"
            input = gets.strip
            Scraper.new.roster.include?(input)
            self.player_info(input)
        end

        def player_info(player_hash)
               puts "#{player_hash}"
        end
    end
    
 

















#      def player_salary
#         puts "What player's salary are you interested in?"
#         input = gets.strip
#         new_salary = Scraper.new.player_salaries(input)
#         if new_salary.include?(input)
#             table = TTY::Table.new(["header1","header2"], [["#{name}", "#{salary}"]])
#             puts table.render(:ascii)
#         elsif
#             !new_salary.include?(input)
#             puts "who is that?"
#        end
#     end




#     def player_info
#         puts " A precocious vet or an auspicious neophyte? Which Knick with the Knack will tickle your fancy?"
#         puts "-----------------------------------------------------------------------------------------------"
#         input = gets.strip
#         new_player = Scraper.new.roster.include?(input)
#         self.display_player(new_player)
#     end
      
#     def display_player(*input)
#         binding.pry
#     end
# end
# end
#             puts "Duping and hooping, what can I show you next?"
#            puts "1. Team info"
#             puts "2. Player stats"
#             puts "3. View another player"
#             puts "4. Exit"
#             input = gets.strip
#             if ["1", "Team info"].include?(input)
#                 self.knicks_info
#             elsif ["2", "Player info"].include?(input)
#                 self.player_info
#             elsif ["3", "Player stats"].include?(input) 
#                 self.player_stats
#             elsif ["4", "Exit"].include?(input)
#                 self.goodbye
#             else
#                 if ["1", "Team info", "2", "Player info", "3", "Player stats", "4", "Exit"].include?(input)
#                 puts "Hexing and Vexing, that was a dubious selection.  Please try again."
#                 self.prompt_selection
#                 end
#         end
#     end
        

#     def player_stats
#         puts "Cruising and Bruising or Wheeling and Dealing?"
#         puts "Spinning and Winning or Weaving and Achieving?"
#         puts "       Which set of stats do you prefer? "
#         puts " 1. Tradiitional   -   2. Advanced    -  3. Exit"
#             input = gets.strip  
#             if ["1", "Traditional"].include?(input)
#                 self.knicks_info
#             elsif ["2", "Advanced"].include?(input)
#                 self.player_info
#             elsif ["3", "Exit"].include?(input) 
#                 self.goodbye
#             else
#                 if ["1", "Team info", "2", "Player info", "3", "Player stats", "4", "Exit"].include?(input)
#                 puts "Hexing and Vexing, that was a dubious selection.  Please try again."
#                 self.player_stats
#             end
#         end
#     end

#     def traditional_stats
#         puts "Please enter the name of the Knick you would like to view"
#             input = gets.strip
#         if Player.all.include?(input)
#             Player.t_stats_hash(input)
#         else
#             puts "Who is that?"
#             self.player_stats
#         end
#     end
                
#     def advanced_stats
#         puts "Please enter the name of the Knick you would like to view"
#             input = gets.strip
#         if Player.all.include?(input)
#             Player.a_stats_hash(input)
#         else
#             puts "Who is that?"
#             self.player_stats
#         end
#     end

   
#         end
#     # def display_team_info
#     #     Scraper.new.scrape_team_info
#     #     puts Terminal::Table.new do
#     #         Team.rows = rows
#     #     end
#     # end

#             # user enters in the name of a player and is given roster and salary info

#             # prompt the user to select between another player, team info, player stats, exit.

#         # end


#         # def player_stats
#         #     prompts the user to select between traditional or advanced

#         # end

#         # def traditional_stats
#         #     ask for player name, returns stats

#         #     prompt another player, team info, advanced stats, player info, exit

#         # end

#         # def advanced_stats

#         #     ask for player name, returns stats

#         #     prompt another player, team info, traditional stats, player info, exit

#             end
#         end
