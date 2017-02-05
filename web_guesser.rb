require 'sinatra'
require 'sinatra/reloader'

@@guesses = 5
SECRET_NUMBER = rand(100)

get '/' do
	if @@guesses == 0
		number = rand(100)
		@@guesses = 5
		message = "You lost! A new number has been generated!"
		color = "White"
	elsif !params['guess'].nil?
		guess = params['guess'].to_i
		vals = check_guess(guess)
		message = vals[0]
		color = vals[1]
	end
	@@guesses-=1
	erb :index, :locals => {:message => message, :color => color}
end

def check_guess(guess)
	if guess > SECRET_NUMBER+5
		message = "Way too high!"
		color = "Red"
	elsif guess < SECRET_NUMBER-5
		message = "Way too low!"
		color = "Blue"
	elsif guess > SECRET_NUMBER
		message = "Too high!"
		color = "LightCoral"
	elsif guess < SECRET_NUMBER
		message = "Too low!"
		color = "LightBlue"
	elsif guess == SECRET_NUMBER
		message = "You got it right, the secret number is #{SECRET_NUMBER}!"
		color = "Green"
	end	
	return [message,color]
end