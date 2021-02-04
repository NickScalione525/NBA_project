class Cli  


    def welcome
        puts "Hello, Welcome! Let's go!"
        self.prompt_selection
    end

    def prompt_selection
        puts "Please select a number"
        puts "1. Teams"
        puts "2. Players"
        puts "3. Stats"
        puts "4. Exit"
        input = gets.strip
        if input == "1"
            self.teams  
        elsif input == "2"
            Api.get_player(input) 
        elsif input == "3"
            self.stats  
        elsif input == "4"
            self.goodbye
        else
            puts "Hey Wise-Guy! I says pick a numbah 1 through 4!"
            self.prompt_selection
        end
    end

    def teams
        puts "1. Atlanta" "----------------------------"     "16. Miami"
        puts "2. Boston" "-----------------------------"     "17. Milwaukee"  
        puts "3. Brooklyn" "---------------------------"    "18. Minnesota"
        puts "4. Charlotte" "--------------------------"      "19. New Orleans"
        puts "5. Chicago" "----------------------------"       "20. New York"
        puts "6. Cleveland" "--------------------------"      "21. Oklahoma City"                             
        puts "7. Dallas" "-----------------------------"      "22. Orlando"                       
        puts "8. Denver" "-----------------------------"      "23. Philadelphia"                          
        puts "9. Detroit" "----------------------------"      "24. Phoenix"                      
        puts "10 Golden State" "-----------------------"      "25. Portland"
        puts "11. Houston" "---------------------------"     "26. Sacramento"
        puts "12. Indiana" "---------------------------"      "27. San Antonio"
        puts "13. Los Angeles (C)" "-------------------"     "28. Toronto"
        puts "14. Los Angeles (L)" "-------------------"     "29. Utah"
        puts "15. Memphis" "---------------------------"     "30. Washington"                             
        puts "------------------------------------------------------------------------"

        puts "Please select a number 1 - 30."
        @input = gets.strip
        if @input == "1" || "2" || "3" || "4" || "5" || "6" || "7" || "8" || "9" || "10" || "11" || "12" || "13" || "14" || "15" || "16" || "17" || "18" || "19" || "20" || "21" || "22" || "23" || "24" || "25" || "26" || "27" || "28" || "29" || "30"
           puts "Your wish is my command"
    
           
           
            Api.get_teams(@input)
        else
            puts "Hey was ahmaddah witch you? I says pick a numbah 1 through 30!!!"
            self.teams
        end

    end


def players
    Api.get_player
end

def stats
    Api.get_stats
end




def goodbye
    puts "Go Bills!"
end
end