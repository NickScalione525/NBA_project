require 'nokogiri'
require 'open-uri'
require 'pry'
require 'terminal-table'

require_relative './player.rb'
require_relative './team.rb'

class Scraper
    def scrape_team_info
        if Team.all.empty?
            doc = Nokogiri::HTML(open("https://www.basketball-reference.com/teams/NYK/2021.html"))
            doc2 = Nokogiri::HTML(open("https://www.basketball-reference.com/teams/NYK/"))
            knicks_hash = {}
            team_hash = {}
            doc2.css("#info p").each do |x|
                    knicks_hash[:team_name] = doc2.css("#info p").children[7].text.strip
                    knicks_hash[:location] = doc2.css("#info p").children[4].text.strip
                    knicks_hash[:overall_record] = doc2.css("#info p").children[13].text.strip
                    knicks_hash[:playoff_apearences] = doc2.css("#info p").children[16].text.strip
                    knicks_hash[:championships] = doc2.css("#info p").children[19].text.strip
            doc.css("div[data-template='Partials/Teams/Summary'] p").each do |info|
                    team_hash[:current_record] = doc.css("div[data-template='Partials/Teams/Summary'] p").children[2].text.strip + " " + doc.css("div[data-template='Partials/Teams/Summary'] p").children[4].text.strip
                    team_hash [:coach] = doc.css("div[data-template='Partials/Teams/Summary'] p").children[15].text.strip
                    team_hash [:executive] = doc.css("div[data-template='Partials/Teams/Summary'] p").children[19].text.strip
                    team_hash [:pts_per_game] = doc.css("div[data-template='Partials/Teams/Summary'] p").children[22].text.strip
                    team_hash [:opp_pts_per_game] = doc.css("div[data-template='Partials/Teams/Summary'] p").children[24].text.strip
                    team_hash [:pace] = doc.css("div[data-template='Partials/Teams/Summary'] p").children[29].text.strip
                    team_hash [:off_rtg] = doc.css("div[data-template='Partials/Teams/Summary'] p").children[32].text.strip
                    team_hash [:def_rtg] = doc.css("div[data-template='Partials/Teams/Summary'] p").children[34].text.strip
                    team_hash [:net_rtg] = doc.css("div[data-template='Partials/Teams/Summary'] p").children[36].text.strip
                    team_hash = knicks_hash.merge(team_hash)
                    Cli.new.knicks_info(team_hash)
                end
            end
        end
    end

    def traditional_player_stats
        doc2 = Nokogiri::HTML(open("https://www.basketball-reference.com/teams/NYK/2021.html"))
        collection = doc2.css("#per_game tr").collect do |tr|
            traditional_hash = {}
            tr.children.each do |t|
                if tr.text.include?("Randle")
                        traditional_hash[:name] = tr.children[1].text
                        traditional_hash[:age] = tr.children[2].text
                        traditional_hash[:games] = tr.children[3].text
                        traditional_hash[:starts] = tr.children[4].text
                        traditional_hash[:mpg] = tr.children[5].text
                        traditional_hash[:fg] = tr.children[6].text
                        traditional_hash[:fga] = tr.children[7].text
                        traditional_hash[:fgperc] = tr.children[8].text
                        traditional_hash[:threes_a_game] = tr.children[9].text
                        traditional_hash[:threes_attempted] = tr.children[10].text
                        traditional_hash[:three_percentage] = tr.children[11].text
                        traditional_hash[:twos_a_game] = tr.children[12].text
                        traditional_hash[:twos_attempted] = tr.children[13].text
                        traditional_hash[:twos_percentage] = tr.children[14].text
                        traditional_hash[:efg] = tr.children[15].text
                        traditional_hash[:ft] = tr.children[16].text
                        traditional_hash[:fta] = tr.children[17].text
                        traditional_hash[:ft_percentage] = tr.children[18].text
                        traditional_hash[:orb] = tr.children[19].text
                        traditional_hash[:drb] = tr.children[20].text
                        traditional_hash[:trb] = tr.children[21].text
                        traditional_hash[:ast] = tr.children[22].text
                        traditional_hash[:stl] = tr.children[23].text
                        traditional_hash[:blk] = tr.children[24].text
                        traditional_hash[:tov] = tr.children[25].text
                        traditional_hash[:pf] = tr.children[26].text
                        traditional_hash[:pts] = tr.children[27].text
                end
            end    
            traditional_hash
        end
    end


    def advanced_player_stats
        doc3 = Nokogiri::HTML(open("https://www.basketball-reference.com/teams/NYK/2021.html"))
        set = doc3.css("#advanced tr").collect do |tr| 
            advanced_hash = {}
            tr.children.each do |t|
                if tr.text.include?("player.name.downcase")
                        advanced_hash[:name] = tr.children[1].text,
                        advanced_hash[:age] = tr.children[2].text,
                        advanced_hash[:games] = tr.children[3].text,
                        advanced_hash[:MP] = tr.children[4].text,
                        advanced_hash[:PER] = tr.children[5].text,
                        advanced_hash[:TS] = tr.children[6].text,
                        advanced_hash[:three_rate] = tr.children[7].text,
                        advanced_hash[:FTr] = tr.children[8].text,
                        advanced_hash[:ORB_percentage] = tr.children[9].text,
                        advanced_hash[:DRB_percentage] = tr.children[10].text,
                        advanced_hash[:TRB_percentage] = tr.children[11].text,
                        advanced_hash[:AST_percentage] = tr.children[12].text,
                        advanced_hash[:STL_percentage] = tr.children[13].text,
                        advanced_hash[:BLK_percentage] = tr.children[14].text,
                        advanced_hash[:TOV_percentage] = tr.children[15].text,
                        advanced_hash[:USG] = tr.children[16].text,
                        advanced_hash[:OWS] = tr.children[18].text,
                        advanced_hash[:DWS] = tr.children[19].text,
                        advanced_hash [:WS] = tr.children[20].text,
                        advanced_hash[:WS_per_forty_eight] = tr.children[21].text,
                        advanced_hash[:OBPM] = tr.children[23].text,
                        advanced_hash[:DBPM] = tr.children[24].text,
                        advanced_hash[:BPM] = tr.children[25].text,
                        advanced_hash[:VORP] = tr.children[26].text
                end
            end    
            advanced_hash
        end
    end

    def roster(*input)
        doc5 = Nokogiri::HTML(open("https://www.basketball-reference.com/teams/NYK/2021.html"))
        doc5.css("#roster tr").collect do |tr| 
            player_hash = {}
            tr.children.each do |t|
                if tr.text.include?(input.join("', '"))
                    player_hash[:name] = tr.children[1].text
                    player_hash[:number] = tr.children[0].text.to_i
                    player_hash[:position] = tr.children[2].text
                    player_hash[:height] = tr.children[3].text
                    player_hash[:weight] = tr.children[4].text
                    player_hash[:birthdate] = tr.children[5].text
                    player_hash[:nationality] = tr.children[6].text
                    player_hash[:experience] = tr.children[7].text
                    player_hash[:college] = tr.children[8].text
                    Cli.new.player_info(player_hash)
                end
            end
        end
    end

    def player_salaries(*input)
        salary_hash = {}
        salary_array = []
        doc4 = Nokogiri::HTML(open("https://www.basketball-reference.com/contracts/NYK.html"))
        doc4.css("#contracts tbody").collect do |tr| 
            tr.children.each do |t|
            if tr.text.include?(input.join("', '"))
                salary_hash[:player_name] = t.children[0].text
            salary_hash[:player_salary] = t.children[2].text
            Salary.new(salary_hash)
            end
            end
        end
    end  

end

