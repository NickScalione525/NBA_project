class Astats
    attr_accessor :name, :age, :games, :MP, :PER, :TS, :three_rate, :Ft, :ORB_percentage, :DRB_percentage, :tB_percentage, :AST_percentage, :STL_percentage, :BLK_percentage, :TOV_percentage, :USG, :OWS, :DWS, :WS, :WS_per_forty_eight, :OBPM, :DBPM, :BPM, :VORP

    @@all = []


    def initialize(advanced_hash)
            advanced_hash.each do |key, value|
            self.send(("#{key}="), value)
            Cli.new.astats_display(advanced_hash)
        end
    end

    def self.all
        @@all
    end

end