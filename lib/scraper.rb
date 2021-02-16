class Scraper
    def scrape_team_info
        knicks_hash = {}
        team_hash = {}
            doc = Nokogiri::HTML(open("https://www.basketball-reference.com/teams/NYK/2021.html"))
            doc2 = Nokogiri::HTML(open("https://www.basketball-reference.com/teams/NYK/"))
            doc2.css("#info p").each do |x|
                    knicks_hash[:team_name] = doc2.css("#info p").children[7].text.strip
                    knicks_hash[:location] = doc2.css("#info p").children[4].text.strip
                    knicks_hash[:overall_record] = doc2.css("#info p").children[13].text.strip
                    knicks_hash[:playoff_apearences] = doc2.css("#info p").children[16].text.strip
                    knicks_hash[:championships] = doc2.css("#info p").children[19].text.strip
            doc.css("div[data-template='Partials/Teams/Summary'] p").each do |info|
                    team_hash[:current_record] = doc.css("div[data-template='Partials/Teams/Summary'] p").children[2].text.strip + " " + doc.css("div[data-template='Partials/Teams/Summary'] p").children[4].text.strip
                    team_hash[:coach] = doc.css("div[data-template='Partials/Teams/Summary'] p").children[15].text.strip
                    team_hash[:executive] = doc.css("div[data-template='Partials/Teams/Summary'] p").children[19].text.strip
                    team_hash[:pts_per_game] = doc.css("div[data-template='Partials/Teams/Summary'] p").children[22].text.strip
                    team_hash[:opp_pts_per_game] = doc.css("div[data-template='Partials/Teams/Summary'] p").children[24].text.strip
                    team_hash[:pace] = doc.css("div[data-template='Partials/Teams/Summary'] p").children[29].text.strip
                    team_hash[:off_rtg] = doc.css("div[data-template='Partials/Teams/Summary'] p").children[32].text.strip
                    team_hash[:def_rtg] = doc.css("div[data-template='Partials/Teams/Summary'] p").children[34].text.strip
                    team_hash[:net_rtg] = doc.css("div[data-template='Partials/Teams/Summary'] p").children[36].text.strip
                    team_hash = knicks_hash.merge(team_hash)
            end
        end
        Team.new(team_hash)
    end

    def traditional_player_stats(player)
        doc2 = Nokogiri::HTML(open("https://www.basketball-reference.com/teams/NYK/2021.html"))
        traditional_hash = {}
        collection = doc2.css("#per_game tbody").each do |tr|
            tr.children.each do |t|
                if t.text.include?(player.name)
                        player.age = t.children[2].text
                        player.games = t.children[3].text
                        player.starts = t.children[4].text
                        player.mpg = t.children[5].text
                        player.fg = t.children[6].text
                        player.fga = t.children[7].text
                        player.fgperc = t.children[8].text
                        player.threes_a_game = t.children[9].text
                        player.threes_attempted = t.children[10].text
                        player.three_percentage = t.children[11].text
                        player.twos_a_game = t.children[12].text
                        player.twos_attempted = t.children[13].text
                        player.twos_percentage = t.children[14].text
                        player.efg = t.children[15].text
                        player.ft = t.children[16].text
                        player.fta = t.children[17].text
                        player.ft_percentage = t.children[18].text
                        player.orb = t.children[19].text
                        player.drb = t.children[20].text
                        player.trb = t.children[21].text
                        player.ast = t.children[22].text
                        player.stl = t.children[23].text
                        player.blk = t.children[24].text
                        player.tov = t.children[25].text
                        player.pf = t.children[26].text
                        player.pts = t.children[27].text
                    end
            end    
        end
    end


    def advanced_player_stats(player)
        doc3 = Nokogiri::HTML(open("https://www.basketball-reference.com/teams/NYK/2021.html"))
        advanced_hash = {}
        set = doc3.css("#advanced tbody").each do |tr| 
            tr.children.each do |t|
                if t.text.include?(player.name)
                        player.mp = t.children[4].text
                        player.per = t.children[5].text
                        player.ts = t.children[6].text
                        player.three_rate = t.children[7].text
                        player.ft = t.children[8].text
                        player.orb_percentage = t.children[9].text
                        player.drb_percentage = t.children[10].text
                        player.tb_percentage = t.children[11].text
                        player.ast_percentage = t.children[12].text
                        player.stl_percentage = t.children[13].text
                        player.blk_percentage = t.children[14].text
                        player.tov_percentage = t.children[15].text
                        player.usg = t.children[16].text
                        player.ows = t.children[18].text
                        player.dws = t.children[19].text
                        player.ws = t.children[20].text
                        player.ws_per_forty_eight = t.children[21].text
                        player.obpm = t.children[23].text
                        player.dbpm = t.children[24].text
                        player.bpm = t.children[25].text
                        player.vorp = t.children[26].text
                end
            end    
        end
    end

    def roster(input)
        doc5 = Nokogiri::HTML(open("https://www.basketball-reference.com/teams/NYK/2021.html"))
        player_hash = {}
        doc5.css("#roster tbody").each do |tr| 
            tr.children.each do |t|
                if t.text.include?(input)
                    player_hash[:name] = t.children[1].text
                    player_hash[:number] = t.children[0].text
                    player_hash[:position] = t.children[2].text
                    player_hash[:height] = t.children[3].text
                    player_hash[:weight] = t.children[4].text
                    player_hash[:birthdate] = t.children[5].text
                    player_hash[:nationality] = t.children[6].text.upcase
                    player_hash[:experience] = t.children[7].text
                    player_hash[:college] = t.children[8].text
                end
            end
        end
        Player.new(player_hash)
    end

    def player_salaries(player)
        doc4 = Nokogiri::HTML(open("https://www.basketball-reference.com/contracts/NYK.html"))
        doc4.css("#contracts tbody").collect do |tr| 
            tr.children.each do |t|
            if t.text.include?(player.name)
                player.salary = t.children[2].text
             end
        end
    end
    end  
end