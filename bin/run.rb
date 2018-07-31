require_relative '../config/environment'



puts "Select your favorite team!"
cli = CommandLineInterface.new
cli.greet
cli.get_user_input
