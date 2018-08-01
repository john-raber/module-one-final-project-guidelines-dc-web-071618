class CommandLineInterface

    def greet
        puts "Welcome!"
        puts "Please select a team."
        display_teams
    end

    def display_teams
        Team.all.each do |team|
            puts "Press #{team.id} for #{team.name}."
        end
    end

    def display_info_options(id)
        puts "Press 1 for #{Team.find(id).name}'s record."
        puts "Press 2 for #{Team.find(id).name}'s matches."
        puts "Press 3 to select a different team."
        puts "Press 4 to exit."

        user_input = get_user_input

        if valid_info_option?(user_input)
            case user_input
            when 1
                display_record(id)
                display_teams
                display_info_options(get_users_team)
            when 2
                display_matches(id)
                display_teams
                display_info_options(get_users_team)
            when 3
                display_teams
                display_info_options(get_users_team)
            when 4
                puts "Goodbye"
            end
        end
    end

    # def get_match_input(team)
    #     puts "Press m for matches"
    #     user_input = gets.chomp.downcase
    #
    #     case user_input
    #     when user_input == 'm'
    #         Team.find(team).all_matches
    #     when user_input == 's'
    #     end
    #
    # end

    # def get_user_input
    #     puts "Please select a team."
    #     display_teams
    #     user_input = gets.chomp.to_i
    #
    #     if valid?(user_input)
    #         display_team_stats(user_input)
    #     else
    #         get_user_input
    #     end
    # end

    def get_user_input
        user_input = gets.chomp.to_i
    end

    def get_users_team
        user_input = get_user_input

        if valid_team?(user_input)
            puts "You have selected #{Team.find(user_input).name}"
            user_input
            # display_team_stats(user_input)
        else
            puts "Invalid input, please try again."
            get_users_team
        end
    end

    def valid_team?(user_input)
        Team.all.map{|team| team.id}.include?(user_input)
    end

    def valid_info_option?(user_input)
        [1, 2, 3].include?(user_input)
    end

    def display_record(user_input)
        team = Team.find(user_input)
        # puts "You have selected #{team.name}"
        puts "#{team.name} has #{team.total_wins.length} wins, #{team.total_losses.length} losses, and #{team.total_draws.length} draws"
    end

    def display_matches(user_input)
        team = Team.find(user_input)
        team.all_matches.each do |m|
            puts "Home Team: #{Team.find(m.home_team_id).name}"
            puts "Away Team: #{Team.find(m.away_team_id).name}"
            puts "Final Score: #{Team.find(m.home_team_id).name} - #{m.home_team_score}, #{Team.find(m.away_team_id).name} - #{m.away_team_score}"
        end
    end
end
