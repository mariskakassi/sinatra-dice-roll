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
  erb(:elephant)
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  "<h1>2d6</h1>
   <p>#{outcome}</p>"
end

get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die

  result = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  "<h1>2d10</h1?
   <p>#{outcome}</p>"
end

get("/dice/1/20") do
  first_die = rand(1..20)

  result = "You rolled a #{first_die}."

  "<h1>2d10</h1?
   <p>#{outcome}</p>"
end

get("/dice/4/5") do
  die1 = rand(1..5)
  die2 = rand(1..5)
  die3 = rand(1..5)
  die4 = rand(1..5)
  sum = die1 + die2 + die3 + die4

  result = "You rolled a #{die1}, a #{die2}, a #{die1}, and a #{die4} for a total of #{sum}."

  "<h1>2d10</h1?
   <p>#{outcome}</p>"
end
