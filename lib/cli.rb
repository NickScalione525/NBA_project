class Cli  


    def welcome
        puts "Hello, Welcome! I'm your host, Walt Clyde Frazier..."
        self.prompt_selection
        end

    def prompt_selection
        puts "Please select from the following"
        puts "1. Team Info"
        puts "2. Player Info"
        puts "3. Player Stats"
        puts "4. Exit"
        input = gets.strip
         if input == "1" || "Team Info" || "team info"
            self.knicks_info
        elsif input == "2" || "Player Info" || "player info"
            self.player_queue
        elsif input == "3" || "Player stats" || "player stats"
            self.player_stats
        elsif input == "4" || "Exit" || "exit"
            self.goodbye
            end
            end

        def knicks_info
            #Displays all the team info at once.
            #Merge team_hash and knicks hash and list Scraper.player_salaries
            new_team = Scraper.scrape_team_info
        end

        def player_queue
            puts "Your 2020-2021 New York Knicks!"
            puts "_______________________________"
            puts "Guards"
            puts "______"
            puts "Immanuel Quickley - 3547269 --- RJ Barrett - 666423 --- Alec Burks - 77"
            puts "Austin Rivers - 393 --- Frank Ntilikina - 347 --- Elfird Payton - 369"
            puts "Dennis Smith Jr. - 421"
            puts "--------------------------------------------------------------------"
            puts "Forwards"
            puts "________"
            puts "Julius Randle - 387 --- Obi Toppin - 3547243 --- Reggie Bullock - 75"
            puts "Ignas Brazdekis - 666464 --- Kevin Knox - 259"
            puts "--------------------------------------------------------------------"
            puts "Centers"
            puts "_______"
            puts "Mitchell Robinson - 399 --- Nerlens Noel - 345 --- Taj Gibson - 173"
            puts "--------------------------------------------------------------------"
            puts "Which Knick has the Knack? Type the number associated with the Knicks you would like to view."
            new_player = false

        
            while !new_player
            # User selects a Knick returning the interpolated Api request
            
            input = gets.strip
            input.to_i
            new_player = Api.get_player(input)
            if !new_player
                puts "Hacking and whacking with a dubious call, try again."
            end
        end
        self.player_info(jnput)
    end

    def player_info(input)
        



        def player_stats
            #gives user a prompt 1 or 2, list all stats based on selection
            puts "Please select one of the following"
            puts "1. Traditional  or 2. Advanced"
            input = gets.strip
            if input == "1" || "Traditional" || "traditional"
                Scraper.player_stats
            elsif input == "2" || "Advanced" || "advanced"
                Scraper.advanced_stats
            else
                
                end
             end

        def goodbye
        puts "Go Knicks!"
        end
    end