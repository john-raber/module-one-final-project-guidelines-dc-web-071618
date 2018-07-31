class Team < ActiveRecord::Base
    has_many :matches 
    has_one :stadium
    has_many :stadiums, through: :matches

    # def create_match(other_team, team_score, other_team_score)
    #     new_match = Match.create(self.id)
    # end

    def home_team_matches
        Match.where("home_team_id = ?", self.id)
    end

    def away_team_matches 
        Match.where("away_team_id = ?", self.id)
    end

    def all_matches 
        home_team_matches + away_team_matches
    end

    def home_team_wins 
        home_team_matches.where("home_team_score > away_team_score")
    end

    def home_team_losses
        home_team_matches.where("home_team_score < away_team_score")
    end

    def total_wins 
        home_team_wins + away_team_wins 
    end

    def home_team_draws 
        home_team_matches.where("home_team_score = away_team_score")
    end

    def away_team_draws 
        away_team_matches.where("home_team_score = away_team_score")
    end

    def total_draws 
        home_team_draws + away_team_draws 
    end

    def home_team_wins_against(name)
        team = Team.find_by(name: name)
        home_team_wins.where("away_team_id = ?", team.id)
    end

    def away_team_wins_against(name)
        team = Team.find_by(name: name)
        away_team_wins.where("home_team_id = ?", team.id)
    end

    def total_wins_against(name)
        home_team_wins_against(name) + away_team_wins_against(name)
    end

    def home_team_losses_against(name)
        team = Team.find_by(name: name)
        home_team_losses.where("away_team_id = ?", team.id)
    end

    def away_team_losses_against(name)
        team = Team.find_by(name: name)
        away_team_losses.where("home_team_id = ?", team.id)
    end

    def total_losses_against(name)
        home_team_losses_against(name) + away_team_losses_against(name)
    end

    def home_team_draws_against(name)
        team = Team.find_by(name: name)
        home_team_draws.where("away_team_id = ?", team.id)
    end

    def away_team_draws_against(name)
        team = Team.find_by(name: name)
        away_team_draws.where("home_team_id = ?", team.id)
    end

    def total_draws_against(name)
        home_team_draws_against(name) + away_team_draws_against(name)
    end

    # def total_record 
    #     "#{total_wins.length} wins, #{total_losses.length} losses, #{total_draws.length} draws"
    # end





    def away_team_wins
        away_team_matches.where("away_team_score > home_team_score")
    end

    def away_team_losses
        away_team_matches.where("away_team_score < home_team_score")
    end

    def total_losses 
        home_team_losses + away_team_losses 
    end

end