require 'pry'
def remove_numbers_from(name)
    name.scan(/[a-zA-Z ]+/)[0].rstrip
end

parsed_csv = File.open('1-premierleague.csv').readlines.map{|line| line.split(',')}
parsed_csv.shift

parsed_csv.each do |line| 

    home_team = Team.find_or_create_by(name: remove_numbers_from(line[2]))
    away_team = Team.find_or_create_by(name: remove_numbers_from(line[5]))
    home_team_score = line[3].split('-')[0].to_i
    away_team_score = line[3].split('-')[1].to_i
    # binding.pry
    Match.create(home_team_id: home_team.id, away_team_id: away_team.id, 
        home_team_score: home_team_score, away_team_score: away_team_score)
end