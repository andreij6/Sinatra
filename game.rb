require 'sinatra'
require 'sinatra/reloader' if development?

#before we process a rout, set the response as
#plain txt and set up an array of moves that
# a player ( & computer) can perform

before do
  content_type :txt
  @defeat = {rock: :scissors, paper: :rock, scissors: :paper}
  @throws = @defeat.keys
end

get '/throw/:type' do
  #play here
  #the params[] hash sotres querystring and form data.
  player_throw = params[:type].to_sym
  
  #in the case of a player providing a throw that is not valid, 
  #we halt with a status code of 403 (Forbidden) and let them
  #know they need to make a valid throw to play.
  if !@throws.include?(player_throw)
    halt 403, "You must throw one of the following: #{@throws}"
  end
  
  #select a random throw for the computer
  computer_throw = @throws.sample
  
  # compare the player and computer throws to determin a winner
  if player_throw == computer_throw
    "You tied with the computer Try again!"
  elsif computer_throw == @defeat[player_throw]
    "Nicely done; #{player_throw} beats #{computer_throw}!"
  else 
    "Ouch; #{computer_throw} beats #{player_throw}.  Better luck next time!"
  end
end
