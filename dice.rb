# /dice.rb

require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')


get("/") do
  erb(:home, { :layout => :wrapper })
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  @result = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  # "<h1>2d6</h1>
  #  <p>#{outcome}</p>"
  erb(:two_six, { :layout => :wrapper })
end

get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die

  @result = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
  
  # "<h1>2d10</h1?
  #  <p>#{@result}</p>"
  erb(:two_ten, { :layout => :wrapper })
end

get("/dice/1/20") do
  first_die = rand(1..20)

  @result = "You rolled a #{first_die}."

  # "<h1>2d10</h1?
  #  <p>#{@result}</p>"
  erb(:one_twenty, { :layout => :wrapper })
end

get("/dice/5/4") do
  die1 = rand(1..4)
  die2 = rand(1..4)
  die3 = rand(1..4)
  die4 = rand(1..4)
  die5 = rand(1..4)
  sum = die1 + die2 + die3 + die4 + die5

  @outcome = "You rolled a #{die1}, #{die2}, #{die3}, #{die4},and #{die5} for a total of #{sum}."

  "<h1>4d5</h1?"
  #  <p>#{@result}</p>"
  erb(:five_four, { :layout => :wrapper })
end
