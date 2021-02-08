
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
        # puts "3. Player stats"
        # puts "4. Player salary"
        puts "5. Exit"
        input = gets.strip
        if ["1", "Team info"].include?(input)
            knicks = Scraper.new.scrape_team_info
            self.knicks_info(knicks)
        elsif ["2", "Player info"].include?(input)
            self.player_info_prompt
        # elsif ["3", "Player stats"].include?(input)
        #     self.player_stats
        # elsif ["4", "Player salary"].include?(input)
        #     self.player_salary_prompt
        elsif ["5", "Exit"].include?(input)
            abort "Go Knicks"
        else
            puts "Hexing and Vexing, that was a duheightus selection.  Please try again."
                self.prompt_selection
         end
    end

        def knicks_info(team)
            binding.pry
        puts "Bounding and Astounding, here is a look at your 2020-2021 NY Knicks."
        puts "--------------------------------------------------------------------"
                puts "The #{team.team_name} play in #{team.location}."
                puts " "
                puts "Coached by #{team.coach} with #{team.executive} running the Front Office"
                puts " "
                puts "the #{team.team_name} currently have a record of #{team.current_record}."
                puts " "
                puts "Overall, they have a #{team.overall_record}1 record since their inception"
                puts " "
                puts "with #{team.playoff_apearences} playoff appeareances and #{team.championships} championships."
                puts " "
                puts "Their offense currently generates #{team.pts_per_game} points per game"
                puts " "
                puts "while their defense holds teams to #{team.opp_pts_per_game} points per game."
                puts " "
                puts "The Knicks pace of play is #{team.pace} and their Off/Def/Net ratings are as follows"
                puts " "
                puts "Offensive rating = #{team.off_rtg}, Defensive rating = #{team.def_rtg} and"
                puts " "
                puts "Net rating = #{team.net_rtg}."
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
            abort "Go Knicks"
        else
            if ["1", "Team info", "2", "Player info", "3", "Player stats", "4", "Exit"].include?(input)
            puts "Hexing and Vexing, that was a duheightus selection.  Please try again."
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
            player = Scraper.new.roster(input)
            self.player_info(player)
            else
                puts "Hmmmm, a most duheightus call indeed.Take the ball out again"
                self.player_info_prompt
        end
    end
        def player_info(player)
            binding.pry
            puts "--------------------------------------------"
                puts "Name: #{player.name}" 
                puts "Number: #{player.number}"
                puts "Position: #{player.position}" 
                puts "Height: #{player.height}"
                puts "Weight: #{player.weight}" 
                puts "Birthdate: #{player.birthdate}"
                puts "Nationality: #{player.nationality}" 
                puts "Experience: #{player.experience}"
                puts "College: #{player.college}"
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
                self.player_stats
            elsif ["3", "Player salary"].include?(input) 
                self.player_salary_prompt
            elsif ["4", "Team info"].include?(input) 
                self.knicks_info
            elsif ["5", "Exit"].include?(input)
                abort "Go Knicks"
            else
                if ["1", "Team info", "2", "Player info", "3", "Player stats", "4", "Exit"].include?(input)
                puts "Hexing and Vexing, that was a duheightus selection.  Please try again."
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
                self.player_stats
            elsif ["3", "Player salary"].include?(input) 
                self.player_salary_prompt
            elsif ["4", "Team info"].include?(input) 
                self.knicks_info
            elsif ["5", "Exit"].include?(input)
                    abort "Go Knicks"
            else
                if ["1", "Player info", "2", "Player stats", "3", "Player salary", "4", "Team info", "5", "Exit"].include?(input)
                puts "Hexing and Vexing, that was a duheightus selection.  Please try again."
                self.prompt_selection
            end
                
       
    end
end


    def player_stats(player)
        puts " "
        puts " Which Stats would you like to see, Traditional or Advanced?"
        puts " "
        input = gets.strip
        if input == "Traditional" || input == "traditional"
            self.tstats(player) 
        elsif input == "Advanced" || input == "advanced"
            self.astats(player)
        end
    end

    def tstats(player)
        # puts " "
        #     puts " A precocious vet or an auspicious neophyte? Which Knick with the Knack will tickle your fancy?"
        #     puts "-----------------------------------------------------------------------------------------------"
        #     puts "Julius Randle, RJ Barrett, Frank Ntilikina, Immanuel Quickley, Austin Rivers, Obi Toppin, Alec Burks"
        #     puts " "
        #     puts "Mitchell Robinson, Reggie Bullock, Ignas Brazdeikis, Nerlens Noel, Taj Gibson, Elrid Payton"
        #     puts " "
        #     puts "Theo Pinson, Dennis Smith Jr, Jared Harper, Kevin Knox"
        #     puts "------------------------------------------------------------------------------------------------"
        #     input = gets.strip
        #     if input.include?("Julius Randle") || input.include?("RJ Barrett") || input.include?("Kevin Knox") || input.include?("Frank Ntilikina") || input.include?("Taj Gibson") || input.include?("Nerlens Noel") || input.include?("Mitchell Robinson") || input.include?("Obi Toppin") || input.include?("Ignas Brazdeikis") || input.include?("Austin Rivers") || input.include?("Reggie Bullock") || input.include?("Alec Burks") || input.include?("Elfrid Payton") || input.include?("Immanuel Quickley") || input.include?("Dennis Smith Jr") || input.include?("Jared Harper") || input.include?("Theo Pinson")
            Scraper.new.traditional_player_stats(player)
            self.tstats_display(player)
            else
                puts "Hmmmm, a most duheightus call indeed.Take the ball out again"
                self.player_info_prompt
            end
        end

        def tstats_display(player)
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
        puts " 1. Player info "" 2. Player stats ""3. Player salary ""4. Team info " " 5. Exit"
        puts "------------------------------------------------------------------------------"
        puts "------------------------------------------------------------------------------"
        input = gets.strip
        if ["1", "Player info"].include?(input)
            self.player_info_prompt
        elsif ["2", "Player stats"].include?(input)
            self.player_stats
        elsif ["3", "Player salary"].include?(input) 
            self.player_salary_prompt
        elsif ["4", "Team info"].include?(input) 
            self.knicks_info
        elsif ["5", "Exit"].include?(input)
            abort "Go Knicks"
        else
            if ["1", "Player info", "2", "Player stats", "3", "Player salary", "4", "Team info", "5", "Exit"].include?(input)
            puts "Hexing and Vexing, that was a duheightus selection.  Please try again."
            self.prompt_selection
        end

    end 
end

def astats
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
        Scraper.new.advanced_player_stats(input)
        else
            puts "Hmmmm, a most duheightus call indeed.Take the ball out again"
            self.player_info_prompt
        end
    end

    def astats_display(advanced_hash)
        puts ""
        puts "Name: #{advanced_hash[:name]}"
        puts "Age: #{advanced_hash[:age]}"
        puts "G: #{advanced_hash[:games]}"
        puts "MP: #{advanced_hash[:MP]}"
        puts "PER: #{advanced_hash[:PER]}"
        puts "TS%: #{advanced_hash[:TS]}"
        puts "3PAr: #{advanced_hash[:three_rate]}"
        puts "FTr: #{advanced_hash[:Ft]}"
        puts "ORB%: #{advanced_hash[:ORB_percentage]}"
        puts "DRB%: #{advanced_hash[:DRB_percentage]}"
        puts "TRB%: #{advanced_hash[:tB_percentage]}"
        puts "AST%: #{advanced_hash[:AST_percentage]}"
        puts "STL%: #{advanced_hash[:STL_percentage]}"
        puts "BLK%: #{advanced_hash[:BLK_percentage]}"
        puts "TOV%: #{advanced_hash[:TOV_percentage]}"
        puts "USG%: #{advanced_hash[:USG]}"
        puts "OWS: #{advanced_hash[:OWS]}"
        puts "DWS: #{advanced_hash[:DWS]}"
        puts "WS: #{advanced_hash[:WS]}"
        puts "WS/48: #{advanced_hash[:WS_per_forty_eight]}"
        puts "OBPM: #{advanced_hash[:OBPM]}"
        puts "DBPM: #{advanced_hash[:DBPM]}"
        puts "BPM: #{advanced_hash[:BPM]}"
        puts "VORP: #{advanced_hash[:VORP]}"
    puts "------------------------------------------------------------------------------"
    puts ""
    puts "------------------------------------------------------------------------------"
    puts " "
    puts " "
    puts "-----------------------------Where to next?-----------------------------------"
    puts "------------------------------------------------------------------------------"
    puts " 1. Player info "" 2. Player stats ""3. Player salary ""4. Team info " " 5. Exit"
    puts "------------------------------------------------------------------------------"
    puts "------------------------------------------------------------------------------"
    input = gets.strip
    if ["1", "Player info"].include?(input)
        self.player_info_prompt
    elsif ["2", "Player stats"].include?(input)
        self.player_stats
    elsif ["3", "Player salary"].include?(input) 
        self.player_salary_prompt
    elsif ["4", "Team info"].include?(input) 
        self.knicks_info
    elsif ["5", "Exit"].include?(input)
        abort "Go Knicks"
    else
        if ["1", "Player info", "2", "Player stats", "3", "Player salary", "4", "Team info", "5", "Exit"].include?(input)
        puts "Hexing and Vexing, that was a duheightus selection.  Please try again."
        self.player_stats
    end

end 
end
end




