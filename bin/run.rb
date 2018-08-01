require_relative '../config/environment'



puts "Select your favorite team!"
cli = CommandLineInterface.new
cli.greet
input = cli.get_users_team
cli.display_info_options(input)
