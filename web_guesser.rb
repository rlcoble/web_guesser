require 'sinatra'
require 'sinatra/reloader'

@@guesses = 5
@@number = rand(100)

get '/' do
	if @@guesses == 0
		@@number = rand(100)
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
	cheat = true if params['cheat']
	erb :index, :locals => {:number => @@number, :message => message, :color => color, :cheat => cheat}
end

def check_guess(guess)
	if guess > @@number+5
		message = "Way too high!"
		color = "Red"
	elsif guess < @@number-5
		message = "Way too low!"
		color = "Blue"
	elsif guess > @@number
		message = "Too high!"
		color = "LightCoral"
	elsif guess < @@number
		message = "Too low!"
		color = "LightBlue"
	elsif guess == @@number
		message = "You got it right, the secret number is #{@@number}!"
		color = "Green"
	end	
	return [message,color]
end