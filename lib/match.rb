class Match < ActiveRecord::Base
    # has_and_belongs_to_many :teams
    belongs_to :stadium
    # def initialize(home_team_id:, away_team_id:, home_team_score:, away_team_score:)
    #     @home_team_id = home_team_id
    #     @away_team_id = away_team_id 
    #     @home_team_score = home_team_score
    #     @away_team_score = away_team_score 
    #     self.home_team.matches << self 
    #     self.away_team.matches << self
    # end
    def home_team
        Team.find(self.home_team_id)
    end

    def away_team
        Team.find(self.away_team_id)
    end

    def self.scores(score)
        (Match.where("home_team_score = ?", score) + Match.where("away_team_score = ?", score)).uniq
    end
end