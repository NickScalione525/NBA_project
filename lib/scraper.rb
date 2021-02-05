require 'nokogiri'
require 'open-uri'
require 'pry'
require 'httparty'


class Scraper

def self.scrape_team_info
doc = Nokogiri::HTML(open("https://www.basketball-reference.com/teams/NYK/2021.html"))
team_hash = {}
doc.css("div[data-template='Partials/Teams/Summary'] p").each do |info|
  
    if info.text.include?("Record")
        team_hash["record"]= info.children[2].text.strip + " " + info.children[4].text.strip
    elsif info.text.include?("Coach")
        team_hash["coach"] = info.children[2].text.strip
    elsif info.text.include?("Executive")
        team_hash["executive"] = info.children[2].text.strip
    elsif info.text.match?("PTS/G")
        team_hash["pts/g, opp pts/g"] = info.children[2].text.strip, info.children[4].text.strip
    elsif info.text.include?("Pace")
        team_hash["pace"]= info.children[-1].text.strip
    elsif info.text.include?("Off Rtg")
        team_hash["off rtg, def rtg, net rtg"] = info.children[2].text.strip, info.children[4].text.strip, info.children[4].text.strip
    end
    team_hash
end

    end

    def self.player_info
        doc2 = Nokogiri::HTML(open("https://www.basketball-reference.com/teams/NYK/2021.html"))
        doc2.css("#all_per_game").each do |category| 
        table = doc2.at("#div_per_game")
        table.search('tr').each do |tr|
            cells = tr.search('th, td')
            cells.each do |cell|
                text = cell.text.strip
                puts CSV.generate_line(cells)
        end
    end
end
end

        def self.player_salaries
        doc3 = Nokogiri::HTML(open("https://www.basketball-reference.com/teams/NYK/2021.html"))
        doc3.css("#all_salaries2").each do |tr|
        table = doc3.at("#salaries2")
        table.search('tr').each do |tr|
            cells = tr.search('th, td')
            cells.each do |cell|
                text = cell.text.strip
                puts CSV.generate_line(cells)
        


binding.pry
            end
        end
   end
end
end

Scraper.player_salaries