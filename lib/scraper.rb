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
        collection = doc2.css("#per_game t").collect do |t|
            traditional = {}
            t.children.each do |t|
                if t.text.include?("Randle")
                        traditional[:name] = t.children[1].text
                        traditional[:age] = t.children[2].text
                        traditional[:games] = t.children[3].text
                        traditional[:starts] = t.children[4].text
                        traditional[:mpg] = t.children[5].text
                        traditional[:fg] = t.children[6].text
                        traditional[:fga] = t.children[7].text
                        traditional[:fgperc] = t.children[8].text
                        traditional[:threes_a_game] = t.children[9].text
                        traditional[:threes_attempted] = t.children[10].text
                        traditional[:three_percentage] = t.children[11].text
                        traditional[:twos_a_game] = t.children[12].text
                        traditional[:twos_attempted] = t.children[13].text
                        traditional[:twos_percentage] = t.children[14].text
                        traditional[:efg] = t.children[15].text
                        traditional[:ft] = t.children[16].text
                        traditional[:fta] = t.children[17].text
                        traditional[:ft_percentage] = t.children[18].text
                        traditional[:orb] = t.children[19].text
                        traditional[:drb] = t.children[20].text
                        traditional[:tb] = t.children[21].text
                        traditional[:ast] = t.children[22].text
                        traditional[:stl] = t.children[23].text
                        traditional[:blk] = t.children[24].text
                        traditional[:tov] = t.children[25].text
                        traditional[:pf] = t.children[26].text
                        traditional[:pts] = t.children[27].text
                end
            end    
        end
    end


    def advanced_player_stats
        doc3 = Nokogiri::HTML(open("https://www.basketball-reference.com/teams/NYK/2021.html"))
        set = doc3.css("#advanced t").collect do |t| 
            advanced_hash = {}
            t.children.each do |t|
                if t.text.include?("player.name.downcase")
                        advanced_hash[:name] = t.children[1].text,
                        advanced_hash[:age] = t.children[2].text,
                        advanced_hash[:games] = t.children[3].text,
                        advanced_hash[:MP] = t.children[4].text,
                        advanced_hash[:PER] = t.children[5].text,
                        advanced_hash[:TS] = t.children[6].text,
                        advanced_hash[:three_rate] = t.children[7].text,
                        advanced_hash[:Ft] = t.children[8].text,
                        advanced_hash[:ORB_percentage] = t.children[9].text,
                        advanced_hash[:DRB_percentage] = t.children[10].text,
                        advanced_hash[:tB_percentage] = t.children[11].text,
                        advanced_hash[:AST_percentage] = t.children[12].text,
                        advanced_hash[:STL_percentage] = t.children[13].text,
                        advanced_hash[:BLK_percentage] = t.children[14].text,
                        advanced_hash[:TOV_percentage] = t.children[15].text,
                        advanced_hash[:USG] = t.children[16].text,
                        advanced_hash[:OWS] = t.children[18].text,
                        advanced_hash[:DWS] = t.children[19].text,
                        advanced_hash [:WS] = t.children[20].text,
                        advanced_hash[:WS_per_forty_eight] = t.children[21].text,
                        advanced_hash[:OBPM] = t.children[23].text,
                        advanced_hash[:DBPM] = t.children[24].text,
                        advanced_hash[:BPM] = t.children[25].text,
                        advanced_hash[:VORP] = t.children[26].text
                end
            end    
            advanced_hash
        end
    end

    def roster(*input)
        doc5 = Nokogiri::HTML(open("https://www.basketball-reference.com/teams/NYK/2021.html"))
        doc5.css("#roster tbody").collect do |t| 
            player_hash = {}
            t.children.each do |t|
                if t.text.include?(input.join("', '"))
                    player_hash[:name] = t.children[1].text
                    player_hash[:number] = t.children[0].text
                    player_hash[:position] = t.children[2].text
                    player_hash[:height] = t.children[3].text
                    player_hash[:weight] = t.children[4].text
                    player_hash[:birthdate] = t.children[5].text
                    player_hash[:nationality] = t.children[6].text.upcase
                    player_hash[:experience] = t.children[7].text
                    player_hash[:college] = t.children[8].text
                    Player.new(player_hash)
                end
            end
        end
    end

    def player_salaries(*input)
        salary_hash = {}
        doc4 = Nokogiri::HTML(open("https://www.basketball-reference.com/contracts/NYK.html"))
        doc4.css("#contracts tbody").collect do |t| 
            t.children.each do |t|
            if t.text.include?(input.join("', '"))
                salary_hash[:player_name] = t.children[0].text
                salary_hash[:player_salary] = t.children[2].text
                Salary.new(salary_hash)
        end
        end
    end
    end  

end
