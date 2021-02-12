
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
        puts "3. Exit"
        input = gets.strip
        if ["1", "Team info"].include?(input)
            knicks = Scraper.new.scrape_team_info
            self.knicks_info(knicks)
        elsif ["2", "Player info"].include?(input)
            self.player_info_prompt
        elsif ["3", "Exit"].include?(input)
            abort "Go Knicks"
        else
            puts "Hexing and Vexing, that was a most dubious selection.  Please try again."
                self.prompt_selection
         end
    end

    def display_team_info
        knicks = Scraper.new.scrape_team_info
        self.knicks_info(knicks)
    end

        def knicks_info(team)
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
        puts " 1. Player info "                                                "2. Exit"
        puts "-------------------------------------------------------------------------"
        puts "-------------------------------------------------------------------------"
        input = gets.strip
        if ["1", "Player info"].include?(input)
            self.player_info_prompt
        elsif ["2", "Exit"].include?(input)
            abort "Go Knicks"
        else
            if ["1", "Player info", "2", "Exit"].include?(input)
            puts "Hexing and Vexing, that was a most dubious selection.  Please try again."
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
            puts "Theo Pinson, Derrick Rose, Jared Harper, Kevin Knox"
            puts "------------------------------------------------------------------------------------------------"
            input = gets.strip
            if input.include?("Julius Randle") || input.include?("RJ Barrett") || input.include?("Kevin Knox") || input.include?("Frank Ntilikina") || input.include?("Taj Gibson") || input.include?("Nerlens Noel") || input.include?("Mitchell Robinson") || input.include?("Obi Toppin") || input.include?("Ignas Brazdeikis") || input.include?("Austin Rivers") || input.include?("Reggie Bullock") || input.include?("Alec Burks") || input.include?("Elfrid Payton") || input.include?("Immanuel Quickley") || input.include?("Dennis Smith Jr") || input.include?("Jared Harper") || input.include?("Theo Pinson")
            player = Scraper.new.roster(input)
            self.player_info(player)
            else
                puts "Hmmmm, a most most dubious call indeed.Take the ball out again"
                self.player_info_prompt
        end
    end
        def player_info(player)
            puts "--------------------------------------------"
                puts "Name - #{player.name}" 
                puts "Number - #{player.number}"
                puts "Position - #{player.position}" 
                puts "Height - #{player.height}"
                puts "Weight - #{player.weight}" 
                puts "Birthdate - #{player.birthdate}"
                puts "Nationality - #{player.nationality}" 
                puts "Experience - #{player.experience}"
                puts "College - #{player.college}"
            puts "------------------------------------------------------------------------------"
            puts "-----------------------------Where to next?-----------------------------------"
            puts "------------------------------------------------------------------------------"
            puts " 1. #{player.name}'s Traditional stats ""   2. #{player.name}'s Advanced stats" 
            puts " "
            puts " 3.#{player.name}'s salary                                      4. Player info"  
            puts " "     
            puts " 5. Team info                                                          6. Exit"
            puts "------------------------------------------------------------------------------"
            puts "------------------------------------------------------------------------------"
            input = gets.strip
            if ["1", "Traditional stats"].include?(input)
                self.tstats(player)
            elsif ["2", "Advanced stats"].include?(input)
                self.astats(player)
            elsif ["3", "Salary"].include?(input)
                self.player_salary_prompt(player)
            elsif ["4", "Player info"].include?(input) 
                self.player_info_prompt
            elsif ["5", "Team info"].include?(input)
                self.display_team_info
            elsif ["6", "Exit"].include?(input)
                abort "Go Knicks"
            else
                if ["1", "Team info", "2", "Player info", "3", "Player stats", "4", "Exit"].include?(input)
                puts "Hexing and Vexing, that was a most dubious selection.  Please try again."
                self.prompt_selection
            end
        end
    end

            def player_salary_prompt(player)
                Scraper.new.player_salaries(player)
                self.player_salary(player)
            end

            def player_salary(player)
            puts "------------------------------------------------------------------------------"
            puts " Player: #{player.name} - Salary: #{player.salary}"
            puts "------------------------------------------------------------------------------"
            puts " "
            puts " "
            puts "-----------------------------Where to next?-----------------------------------"
            puts "------------------------------------------------------------------------------"
            puts " 1. #{player.name}'s Traditional stats ""  2. #{player.name}'s Advanced stats "
            puts " "
            puts " 1. Player info "  "              4. Team info                      " "5. Exit"
            puts "------------------------------------------------------------------------------"
            puts "------------------------------------------------------------------------------"
            input = gets.strip
            if ["1", "Player info"].include?(input)
                self.player_info_prompt
            elsif ["2", "Traditional stats"].include?(input)
                self.tstats(player)
            elsif ["3", "Advanced stats"].include?(input) 
                self.astats(player)
            elsif ["4", "Team info"].include?(input) 
                self.knicks_info
            elsif ["5", "Exit"].include?(input)
                    abort "Go Knicks"
            else
                if ["1", "Player info", "2", "Traditional stats", "3", "Advanced stats", "4", "Team info", "5", "Exit"].include?(input)
                puts "Hexing and Vexing, that was a most dubious selection.  Please try again."
                self.prompt_selection
            end
                
       
    end
end

    def tstats(player)
            Scraper.new.traditional_player_stats(player)
            self.tstats_display(player)
        end

        def tstats_display(player)
            puts ""
            puts "Name: #{player.name}"
            puts "Age: #{player.age}"
            puts "G: #{player.games}"
            puts "GS: #{player.starts}"
            puts "MPG: #{player.mpg}"
            puts "FG: #{player.fg}"
            puts "FGA: #{player.fga}"
            puts "FG%: #{player.fgperc}"
            puts "3P: #{player.threes_a_game}"
            puts "3PA: #{player.threes_attempted}"
            puts "3P%: #{player.three_percentage}"
            puts "2P: #{player.twos_a_game}"
            puts "2PA: #{player.twos_attempted}"
            puts "2P%: #{player.twos_percentage}"
            puts "EFG%: #{player.efg}"
            puts "FT: #{player.ft}"
            puts "FTA: #{player.fta}"
            puts "FT%: #{player.ft_percentage}"
            puts "Offensive Rebounds: #{player.orb}"
            puts "Defensive Rebounds: #{player.drb}"
            puts "Total Rebounds: #{player.trb}"
            puts "Assist: #{player.ast}"
            puts "Steals: #{player.stl}"
            puts "Blocks: #{player.blk}"
            puts "Turnovers: #{player.tov}"
            puts "PFs: #{player.pf}"
            puts "PPG: #{player.pts}"
        puts "------------------------------------------------------------------------------"
        puts ""
        puts "------------------------------------------------------------------------------"
        puts " "
        puts " "
        puts "-----------------------------Where to next?---------------------------------------"
        puts "----------------------------------------------------------------------------------"
        puts " 1. Player info "" 2. #{player.name}'s Advanced stats ""3. #{player.name}'s salary" 
        puts " "
        puts " 4. Team info " "                                                          5. Exit"
        puts "----------------------------------------------------------------------------------"
        puts "----------------------------------------------------------------------------------"
        input = gets.strip
        if ["1", "Player info"].include?(input)
            self.player_info_prompt
        elsif ["2", "Advanced stats"].include?(input)
            self.astats(player)
        elsif ["3", "Player salary"].include?(input) 
            self.player_salary_prompt(player)
        elsif ["4", "Team info"].include?(input) 
            self.display_team_info
        elsif ["5", "Exit"].include?(input)
            abort "Go Knicks"
        else
            if ["1", "Player info", "2", "Player stats", "3", "Player salary", "4", "Team info", "5", "Exit"].include?(input)
            puts "Hexing and Vexing, that was a most dubious selection.  Please try again."
            self.prompt_selection
        end

    end 
end

def astats(player)
        Scraper.new.advanced_player_stats(player)
        self.astats_display(player)
       
    end

    def astats_display(player)
        puts ""
        puts "Name: #{player.name}"
        puts "Age: #{player.age}"
        puts "G: #{player.games}"
        puts "MP: #{player.mp}"
        puts "PER: #{player.per}"
        puts "TS%: #{player.ts}"
        puts "3PAr: #{player.three_rate}"
        puts "FTr: #{player.ft}"
        puts "ORB%: #{player.orb_percentage}"
        puts "DRB%: #{player.drb_percentage}"
        puts "TRB%: #{player.tb_percentage}"
        puts "AST%: #{player.ast_percentage}"
        puts "STL%: #{player.stl_percentage}"
        puts "BLK%: #{player.blk_percentage}"
        puts "TOV%: #{player.tov_percentage}"
        puts "USG%: #{player.usg}"
        puts "OWS: #{player.ows}"
        puts "DWS: #{player.dws}"
        puts "WS: #{player.ws}"
        puts "WS/48: #{player.ws_per_forty_eight}"
        puts "OBPM: #{player.obpm}"
        puts "DBPM: #{player.dbpm}"
        puts "BPM: #{player.bpm}"
        puts "VORP: #{player.vorp}"
    puts "------------------------------------------------------------------------------"
    puts ""
    puts "------------------------------------------------------------------------------"
    puts " "
    puts " "
    puts "-----------------------------Where to next?-------------------------------------------"
    puts "--------------------------------------------------------------------------------------"
    puts " 1. Player info "" 2. #{player.name}'s Traditional stats ""3. #{player.name}'s salary "
    puts " "
    puts "4. Team info " "                                                               5. Exit"
    puts "--------------------------------------------------------------------------------------"
    puts "--------------------------------------------------------------------------------------"
    input = gets.strip
    if ["1", "Player info"].include?(input)
        self.player_info_prompt
    elsif ["2", "Traditional stats"].include?(input)
        self.tstats(player)
    elsif ["3", "Player salary"].include?(input) 
        self.player_salary_prompt(player)
    elsif ["4", "Team info"].include?(input) 
        self.display_team_info
    elsif ["5", "Exit"].include?(input)
        abort "Go Knicks"
    else
        if ["1", "Player info", "2", "Player stats", "3", "Player salary", "4", "Team info", "5", "Exit"].include?(input)
        puts "Hexing and Vexing, that was a most dubious selection.  Please try again."
        self.player_stats
    end

end 
end
end




