require 'gmail'
require './config'

users = Users.build
focus_areas = FocusAreas.build

Gmail.connect!(ENV["USERNAME"], ENV["PASSWORD"]) do |gmail|
  users.each do |user| 
    ilp = Ilp.for(user, focus_areas)
    IlpMail.for(user, ilp, gmail).deliver!
  end
end