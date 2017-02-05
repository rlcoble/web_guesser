require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
	if !params['guess'].nil?
		guess = params['guess'].to_i
		params = check_guess(guess)
	end
	erb :index, :locals => {:message => params[0], :color => params[1]}
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