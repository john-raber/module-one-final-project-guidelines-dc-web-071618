class CommandLineInterface

    def greet
        puts "Welcome!" 
    end

    def display_teams
        Team.all.each do |team| 
            puts "Press #{team.id} for #{team.name}."
        end
    end

    def get_user_input
        puts "Please select your favorite team."
        display_teams 
        user_input = gets.chomp.to_i

        if valid?(user_input)
            display_team_stats(user_input)
        else
            get_user_input 
        end
    end

    def valid?(user_input)
        Team.all.map{|team| team.id}.include?(user_input)
    end

    def display_team_stats(user_input)
        team = Team.find(user_input)
        puts "You have selected #{team.name}"
        puts "#{team.name} has #{team.total_wins.length} wins, #{team.total_losses.length} losses, and #{team.total_draws.length} draws"
    end

end