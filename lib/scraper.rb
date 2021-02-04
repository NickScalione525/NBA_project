require 'nokogiri'
require 'open-uri'
require 'pry'


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
end

end

end


Scraper.scrape_team_info