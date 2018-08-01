require_relative '../config/environment'



cli = CommandLineInterface.new
cli.greet
input = cli.get_users_team
cli.display_info_options(input)
