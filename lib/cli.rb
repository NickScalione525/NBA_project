
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
            self.player_info_prompt
        elsif ["3", "Player stats"].include?(input)
            self.player_stats
        elsif ["4", "Player salary"].include?(input)
            self.player_salary_prompt
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
                puts "Overall, they have a #{team_hash[:overall_record]}1 record since their inception"
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
            self.player_info_prompt
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

        def player_info_prompt
            puts " "
            puts " A precocious vet or an auspicious neophyte? Which Knick with the Knack will tickle your fancy?"
            puts "-----------------------------------------------------------------------------------------------"
            puts "Julius Randle, RJ Barrett, Frank Ntilikina, Immanuel Quickley, Austin Rivers, Obi Toppin, Alec Burks"
            puts " "
            puts "Mitchell Robinson, Reggie Bullock, Ignas Brazdeikis, Nerlens Noel, Taj Gibson, Elrid Payton"
            puts " "
            puts "Theo Pinson, Dennis Smith Jr, Jared Harper, Kevin Knox"
            puts "------------------------------------------------------------------------------------------------"
            input = gets.strip
            if input.include?("Julius Randle") || input.include?("RJ Barrett") || input.include?("Kevin Knox") || input.include?("Frank Ntilikina") || input.include?("Taj Gibson") || input.include?("Nerlens Noel") || input.include?("Mitchell Robinson") || input.include?("Obi Toppin") || input.include?("Ignas Brazdeikis") || input.include?("Austin Rivers") || input.include?("Reggie Bullock") || input.include?("Alec Burks") || input.include?("Elfrid Payton") || input.include?("Immanuel Quickley") || input.include?("Dennis Smith Jr") || input.include?("Jared Harper") || input.include?("Theo Pinson")
            Scraper.new.roster(input)
            else
                puts "Hmmmm, a most dubious call indeed.Take the ball out again"
                self.player_info_prompt
        end
    end
        def player_info(player_hash)
            puts "--------------------------------------------"
                puts "Player: #{player_hash[:name]}" 
                puts "Number: #{player_hash[:number]}"
                puts "Position: #{player_hash[:position]}" 
                puts "Height: #{player_hash[:height]}"
                puts "Weight: #{player_hash[:weight]}" 
                puts "Birthdate: #{player_hash[:birthdate]}"
                puts "Nationality: #{player_hash[:nationality]}" 
                puts "Experience: #{player_hash[:experience]}"
                puts "College: #{player_hash[:college]}"
            puts "---------------------------------------------"
            puts "-----------------------------Where to next?-----------------------------------"
            puts "------------------------------------------------------------------------------"
            puts " 1. Player info "" 2. Player stats ""3. Player salary ""4. Team info" "5. Exit"
            puts "------------------------------------------------------------------------------"
            puts "------------------------------------------------------------------------------"
            input = gets.strip
            if ["1", "Player info"].include?(input)
                self.player_info_prompt
            elsif ["2", "Player stats"].include?(input)
                self.player_stats_prompt
            elsif ["3", "Player salary"].include?(input) 
                self.player_salary_prompt
            elsif ["4", "Team info"].include?(input) 
                self.knicks_info
            elsif ["5", "Exit"].include?(input)
                self.goodbye
            else
                if ["1", "Team info", "2", "Player info", "3", "Player stats", "4", "Exit"].include?(input)
                puts "Hexing and Vexing, that was a dubious selection.  Please try again."
                self.prompt_selection
            end
        end
    end

            def player_salary_prompt
                puts " "
                puts "Folks, these guys are making a lot more than I did when i played, lets see who is making what this year"
                puts "-----------------------------------------------------------------------------------------------"
                puts "Julius Randle, RJ Barrett, Frank Ntilikina, Immanuel Quickley, Austin Rivers, Obi Toppin, Alec Burks"
                puts " "
                puts "Mitchell Robinson, Reggie Bullock, Ignas Brazdeikis, Nerlens Noel, Taj Gibson, Elrid Payton"
                puts " "
                puts "Theo Pinson, Dennis Smith Jr, Jared Harper, Kevin Knox"
                puts "------------------------------------------------------------------------------------------------"
                input = gets.strip
                if input.include?("Julius Randle") || input.include?("RJ Barrett") || input.include?("Kevin Knox") || input.include?("Frank Ntilikina") || input.include?("Taj Gibson") || input.include?("Nerlens Noel") || input.include?("Mitchell Robinson") || input.include?("Obi Toppin") || input.include?("Ignas Brazdeikis") || input.include?("Austin Rivers") || input.include?("Reggie Bullock") || input.include?("Alec Burks") || input.include?("Elfrid Payton") || input.include?("Immanuel Quickley") || input.include?("Dennis Smith Jr") || input.include?("Jared Harper") || input.include?("Theo Pinson")
                Scraper.new.player_salaries(input)
                
                else
                    puts "Driving and Striving, but to no avail. Let's try that again"
                    self.player_salary_prompt
               end
            end

            def player_salary(salary_hash)
            puts "------------------------------------------------------------------------------"
            puts " Player: #{salary_hash[:player_name]} - Salary: #{salary_hash[:player_salary]}"
            puts "------------------------------------------------------------------------------"
            puts " "
            puts " "
            puts "-----------------------------Where to next?-----------------------------------"
            puts "------------------------------------------------------------------------------"
            puts " 1. Player info "" 2. Player stats ""3. Player salary ""4. Team info" "5. Exit"
            puts "------------------------------------------------------------------------------"
            puts "------------------------------------------------------------------------------"
            input = gets.strip
            if ["1", "Player info"].include?(input)
                self.player_info_prompt
            elsif ["2", "Player stats"].include?(input)
                self.player_stats_prompt
            elsif ["3", "Player salary"].include?(input) 
                self.player_salary_prompt
            elsif ["4", "Team info"].include?(input) 
                self.knicks_info
            elsif ["5", "Exit"].include?(input)
                self.goodbye
            else
                if ["1", "Player info", "2", "Player stats", "3", "Player salary", "4", "Team info", "5", "Exit"].include?(input)
                puts "Hexing and Vexing, that was a dubious selection.  Please try again."
                self.prompt_selection
            end
                
       
    end
end


    def player_stats
        puts " "
        puts " Which Stats would you like to see, Traditional or Advanced?"
        puts " "
        input = gets.strip
        if input == "Traditional" || input == "traditional"
            self.tstats 
        elsif input == "Advanced" || input == "advanced"
            self.astats
        end
    end

    def tstats
        puts " "
            puts " A precocious vet or an auspicious neophyte? Which Knick with the Knack will tickle your fancy?"
            puts "-----------------------------------------------------------------------------------------------"
            puts "Julius Randle, RJ Barrett, Frank Ntilikina, Immanuel Quickley, Austin Rivers, Obi Toppin, Alec Burks"
            puts " "
            puts "Mitchell Robinson, Reggie Bullock, Ignas Brazdeikis, Nerlens Noel, Taj Gibson, Elrid Payton"
            puts " "
            puts "Theo Pinson, Dennis Smith Jr, Jared Harper, Kevin Knox"
            puts "------------------------------------------------------------------------------------------------"
            input = gets.strip
            if input.include?("Julius Randle") || input.include?("RJ Barrett") || input.include?("Kevin Knox") || input.include?("Frank Ntilikina") || input.include?("Taj Gibson") || input.include?("Nerlens Noel") || input.include?("Mitchell Robinson") || input.include?("Obi Toppin") || input.include?("Ignas Brazdeikis") || input.include?("Austin Rivers") || input.include?("Reggie Bullock") || input.include?("Alec Burks") || input.include?("Elfrid Payton") || input.include?("Immanuel Quickley") || input.include?("Dennis Smith Jr") || input.include?("Jared Harper") || input.include?("Theo Pinson")
            Scraper.new.traditional_player_stats(input)
            else
                puts "Hmmmm, a most dubious call indeed.Take the ball out again"
                self.player_info_prompt
            end
        end

        def tstats_display(traditional_hash)
            puts ""
            puts "Name: #{traditional_hash[:name]}"
            puts "Age: #{traditional_hash[:age]}"
            puts "G: #{traditional_hash[:games]}"
            puts "GS: #{traditional_hash[:starts]}"
            puts "MPG: #{traditional_hash[:mpg]}"
            puts "FG: #{traditional_hash[:fg]}"
            puts "FGA: #{traditional_hash[:fga]}"
            puts "FG%: #{traditional_hash[:fgperc]}"
            puts "3P: #{traditional_hash[:threes_a_game]}"
            puts "3PA: #{traditional_hash[:threes_attempted]}"
            puts "3P%: #{traditional_hash[:three_percentage]}"
            puts "2P: #{traditional_hash[:twos_a_game]}"
            puts "2PA: #{traditional_hash[:twos_attempted]}"
            puts "2P%: #{traditional_hash[:twos_percentage]}"
            puts "EFG%: #{traditional_hash[:efg]}"
            puts "FT: #{traditional_hash[:ft]}"
            puts "FTA: #{traditional_hash[:fta]}"
            puts "FT%: #{traditional_hash[:ft_percentage]}"
            puts "Offensive Rebounds: #{traditional_hash[:orb]}"
            puts "Defensive Rebounds: #{traditional_hash[:drb]}"
            puts "Total Rebounds: #{traditional_hash[:trb]}"
            puts "Assist: #{traditional_hash[:ast]}"
            puts "Steals: #{traditional_hash[:stl]}"
            puts "Blocks: #{traditional_hash[:blk]}"
            puts "Turnovers: #{traditional_hash[:tov]}"
            puts "PFs: #{traditional_hash[:pf]}"
            puts "PPG: #{traditional_hash[:pts]}"
        puts "------------------------------------------------------------------------------"
        puts ""
        puts "------------------------------------------------------------------------------"
        puts " "
        puts " "
        puts "-----------------------------Where to next?-----------------------------------"
        puts "------------------------------------------------------------------------------"
        puts " 1. Player info "" 2. Player stats ""3. Player salary ""4. Team info" "5. Exit"
        puts "------------------------------------------------------------------------------"
        puts "------------------------------------------------------------------------------"
        input = gets.strip
        if ["1", "Player info"].include?(input)
            self.player_info_prompt
        elsif ["2", "Player stats"].include?(input)
            self.player_stats_prompt
        elsif ["3", "Player salary"].include?(input) 
            self.player_salary_prompt
        elsif ["4", "Team info"].include?(input) 
            self.knicks_info
        elsif ["5", "Exit"].include?(input)
            self.goodbye
        else
            if ["1", "Player info", "2", "Player stats", "3", "Player salary", "4", "Team info", "5", "Exit"].include?(input)
            puts "Hexing and Vexing, that was a dubious selection.  Please try again."
            self.prompt_selection
        end

    end 
end
end










      # elsif !player_hash.include?("Theo Pinson" || "Dennis Smith Jr" || "Jared Harper" || "Kevin Knox" || "Mitchell Robinson" || "Reggie Bullock" || "Ignas Brazdeikis" "Nerlens Noel" || "Taj Gibson" || "Elrid Payton" || "Julius Randle" || "RJ Barrett" || "Frank Ntilikina" || "Immanuel Quickley" || "Austin Rivers" || "Obi Toppin" || "Alec Burks")
            #     puts "Hmmmmm who is that?"


       







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
