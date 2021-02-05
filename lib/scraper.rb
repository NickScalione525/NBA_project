require 'nokogiri'
require 'open-uri'
require 'pry'
require 'httparty'
require 'csv'
require 'terminal-table'

require_relative './player.rb'
require_relative './api.rb'


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


   


    def self.player_stats
        doc2 = Nokogiri::HTML(open("https://www.basketball-reference.com/teams/NYK/2021.html"))
        collection = doc2.css("#per_game tr").collect do |tr|
        traditional_hash = {}
        tr.children.each do |t|
            if tr.text.include?("Randle")
                traditional_hash = {
                    name: tr.children[1].text, 
                    age: tr.children[2].text,
                    games: tr.children[3].text,
                    starts: tr.children[4].text,
                    mpg: tr.children[5].text,
                    fg: tr.children[6].text,
                    fga: tr.children[7].text,
                    fgperc: tr.children[8].text,
                    threes_a_game: tr.children[9].text,
                    threes_attempted: tr.children[10].text,
                    three_percentage: tr.children[11].text,
                    twos_a_game: tr.children[12].text,
                    twos_attempted: tr.children[13].text,
                    twos_percentage: tr.children[14].text,
                    efg: tr.children[15].text,
                    ft: tr.children[16].text,
                    fta: tr.children[17].text,
                    ft_percentage: tr.children[18].text,
                    orb: tr.children[19].text,
                    drb: tr.children[20].text,
                    trb: tr.children[21].text,
                    ast: tr.children[22].text,
                    stl: tr.children[23].text,
                    blk: tr.children[24].text,
                    tov: tr.children[25].text, 
                    pf: tr.children[26].text,
                    pts: tr.children[27].text}
            else
         end
            end    
            end
        end


       def self.advanced_player_stats
        doc3 = Nokogiri::HTML(open("https://www.basketball-reference.com/teams/NYK/2021.html"))
        set = doc3.css("#advanced tr").collect do |tr| 
        advanced_hash = {}
        tr.children.each do |t|
           if tr.text.include?("player.name.downcase")
                advanced_hash = {
                    name: tr.children[1].text,
                    age: tr.children[2].text,
                    games: tr.children[3].text,
                    MP: tr.children[4].text,
                    PER: tr.children[5].text,
                    TS: tr.children[6].text,
                    three_rate: tr.children[7].text,
                    FTr: tr.children[8].text,
                    ORB_percentage: tr.children[9].text,
                    DRB_percentage: tr.children[10].text,
                    TRB_percentage: tr.children[11].text,
                    AST_percentage: tr.children[12].text,
                    STL_percentage: tr.children[13].text,
                    BLK_percentage: tr.children[14].text,
                    TOV_percentage: tr.children[15].text,
                    USG: tr.children[16].text,
                    OWS: tr.children[18].text,
                    DWS: tr.children[19].text,
                    WS: tr.children[20].text,
                    WS_per_forty_eight: tr.children[21].text,
                    OBPM: tr.children[23].text,
                    DBPM: tr.children[24].text,
                    BPM: tr.children[25].text,
                    VORP: tr.children[26].text}
            else
           end
        end    
     end
    end

        def self.roster
        doc5 = Nokogiri::HTML(open("https://www.basketball-reference.com/teams/NYK/2021.html"))
        doc5.css("#roster tr").collect do |tr| 
        player_hash = {}
        tr.children.each do |t|
           if tr.text.include?("player.name.downcase")
                player_hash = {
                    name: tr.children[1].text,
                    number: tr.children[0].text,
                    position: tr.children[2].text,
                    height: tr.children[3].text,
                    weight: tr.children[4].text,
                    birthdate: tr.children[5].text,
                    nationality: tr.children[6].text,
                    experience: tr.children[7].text,
                    college: tr.children[8].text}
           end
        end
    end
end

    def self.player_salaries
    salary_hash = {}
    doc4 = Nokogiri::HTML(open("https://www.basketball-reference.com/contracts/NYK.html"))
    doc4.css("#contracts tr").collect do |tr|
    tr.children.each do |t|
        if tr.text.include? ("Randle")
                salary_hash = {
                name: tr.children[0].text,
                age: tr.children[1].text,
                salary: tr.children[2].text}     
         else
        end
        end
          
                
    end

        end



                


end


Scraper.player_stats