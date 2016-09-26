require 'gmail'
require './config'

Gmail.connect!(ENV["USERNAME"], ENV["PASSWORD"]) do |gmail|
  p gmail.logged_in?
end