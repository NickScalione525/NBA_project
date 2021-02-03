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
        input = gets.strip
        if input == "1"
            self.teams  
        elsif input == "2"
            self.players  
        elsif input == "3"
            self.stats  
        else
            puts "Hey Wise-Guy! I says pick a numbah 1 through 3!"
            self.prompt_selection
        end
    end

    def teams
        Api.teams.collect do 











end