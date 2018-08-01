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
        puts "Press 3 for #{Team.find(id).name}'s match wins."
        puts "Press 4 for #{Team.find(id).name}'s match losses."
        puts "Press 5 for #{Team.find(id).name}'s match draws."
        puts "Press 6 for #{Team.find(id).name}'s home matches."
        puts "Press 7 for #{Team.find(id).name}'s away matches."
        puts "Press 8 for #{Team.find(id).name}'s record against a specific team."
        puts "Press 9 for #{Team.find(id).name}'s wins against a specific team."
        puts "Press 10 for #{Team.find(id).name}'s losses against a specific team."
        puts "Press 11 for #{Team.find(id).name}'s draws with a specific team."
        puts "Press 12 to select a different team."
        puts "Press 13 to exit."

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
                display_match_wins(id)
                display_teams
                display_info_options(get_users_team)
            when 4
                display_match_losses(id)
                display_teams
                display_info_options(get_users_team)
            when 5
                display_match_draws(id)
                display_teams
                display_info_options(get_users_team)
            when 6
                display_home_matches(id)
                display_teams
                display_info_options(get_users_team)
            when 7
                display_away_matches(id)
                display_teams
                display_info_options(get_users_team)
            when 8
                display_record_against(id)
                display_teams
                display_info_options(get_users_team)
            when 9
                display_wins_against(id)
                display_teams
                display_info_options(get_users_team)
            when 10
                display_losses_against(id)
                display_teams
                display_info_options(get_users_team)
            when 11
                display_draws_against(id)
                display_teams
                display_info_options(get_users_team)
            when 12
                display_teams
                display_info_options(get_users_team)
            when 13
                puts "Goodbye"
            else
                puts "Invalid input, please try again."
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
        (1..13).to_a.include?(user_input)
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

    def display_match_wins(user_input)
        team = Team.find(user_input)
        team.total_wins.each do |m|
            puts "Home Team: #{Team.find(m.home_team_id).name}"
            puts "Away Team: #{Team.find(m.away_team_id).name}"
            puts "Final Score: #{Team.find(m.home_team_id).name} - #{m.home_team_score}, #{Team.find(m.away_team_id).name} - #{m.away_team_score}"
        end
    end

    def display_match_losses(user_input)
        team = Team.find(user_input)
        team.total_losses.each do |m|
            puts "Home Team: #{Team.find(m.home_team_id).name}"
            puts "Away Team: #{Team.find(m.away_team_id).name}"
            puts "Final Score: #{Team.find(m.home_team_id).name} - #{m.home_team_score}, #{Team.find(m.away_team_id).name} - #{m.away_team_score}"
        end
    end

    def display_match_draws(user_input)
        team = Team.find(user_input)
        team.total_draws.each do |m|
            puts "Home Team: #{Team.find(m.home_team_id).name}"
            puts "Away Team: #{Team.find(m.away_team_id).name}"
            puts "Final Score: #{Team.find(m.home_team_id).name} - #{m.home_team_score}, #{Team.find(m.away_team_id).name} - #{m.away_team_score}"
        end
    end

    def display_home_matches(user_input)
        team = Team.find(user_input)
        team.home_team_matches.each do |m|
            puts "Home Team: #{Team.find(m.home_team_id).name}"
            puts "Away Team: #{Team.find(m.away_team_id).name}"
            puts "Final Score: #{Team.find(m.home_team_id).name} - #{m.home_team_score}, #{Team.find(m.away_team_id).name} - #{m.away_team_score}"
        end
    end

    def display_away_matches(user_input)
        team = Team.find(user_input)
        team.away_team_matches.each do |m|
            puts "Home Team: #{Team.find(m.home_team_id).name}"
            puts "Away Team: #{Team.find(m.away_team_id).name}"
            puts "Final Score: #{Team.find(m.home_team_id).name} - #{m.home_team_score}, #{Team.find(m.away_team_id).name} - #{m.away_team_score}"
        end
    end

    def display_record_against(original_id)
        puts "Please select the team you would like to compare with #{Team.find(original_id).name}."
        display_teams
        against_id = get_user_input

        if valid_team?(against_id)
            team = Team.find(original_id)
            against_team_name = Team.find(against_id).name
            puts "#{team.name} has #{team.total_wins_against(against_team_name).length} wins, #{team.total_losses_against(against_team_name).length} losses, and #{team.total_draws_against(against_team_name).length} draws against #{against_team_name}."
        else
            puts "Invalid input, please try again."
            display_record_against(original_id)
        end
    end

    def display_wins_against(original_id)
        puts "Please select the team you would like to compare with #{Team.find(original_id).name}."
        display_teams
        against_id = gets_user_input

        if valid_team?(against_id)
            team = Team.find(original_id)
            against_team_name = Team.find(against_id).name
            team.total_wins_against.each do |m|
                puts "Home Team: #{Team.find(m.home_team_id).name}"
                puts "Away Team: #{Team.find(m.away_team_id).name}"
                puts "Final Score: #{Team.find(m.home_team_id).name} - #{m.home_team_score}, #{Team.find(m.away_team_id).name} - #{m.away_team_score}"
            end
        else
            puts "Invalid input, please try again."
            display_wins_against(original_id)
        end
    end

    def display_losses_against(original_id)
        puts "Please select the team you would like to compare with #{Team.find(original_id).name}."
        display_teams
        against_id = gets_user_input

        if valid_team?(against_id)
            team = Team.find(original_id)
            against_team_name = Team.find(against_id).name
            team.total_losses_against.each do |m|
                puts "Home Team: #{Team.find(m.home_team_id).name}"
                puts "Away Team: #{Team.find(m.away_team_id).name}"
                puts "Final Score: #{Team.find(m.home_team_id).name} - #{m.home_team_score}, #{Team.find(m.away_team_id).name} - #{m.away_team_score}"
            end
        else
            puts "Invalid input, please try again."
            display_losses_against(original_id)
        end
    end

    def display_draws_against(original_id)
        puts "Please select the team you would like to compare with #{Team.find(original_id).name}."
        display_teams
        against_id = gets_user_input

        if valid_team?(against_id)
            team = Team.find(original_id)
            against_team_name = Team.find(against_id).name
            team.total_draws_against.each do |m|
                puts "Home Team: #{Team.find(m.home_team_id).name}"
                puts "Away Team: #{Team.find(m.away_team_id).name}"
                puts "Final Score: #{Team.find(m.home_team_id).name} - #{m.home_team_score}, #{Team.find(m.away_team_id).name} - #{m.away_team_score}"
            end
        else
            puts "Invalid input, please try again."
            display_draws_against(original_id)
        end
    end
end
