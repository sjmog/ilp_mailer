require 'gmail'
require './config'
require './lib/users'
require './lib/focus_areas'
require './lib/ilp'
require './lib/ilp_mail'

users = Users.build
focus_areas = FocusAreas.build

print "Welcome to the ILP Mailer!\n\n"
print "Please enter your (coach) name (we'll use this to sign off the emails):\n"
coach_name = gets.chomp

print "\nThank you! Now sending emails...\n\n"

Gmail.connect!(ENV["USERNAME"], ENV["PASSWORD"]) do |gmail|
  users.each do |user| 
    print "Sending email to #{ user.name } (#{ user.email })..."
    ilp = Ilp.build(user, focus_areas, coach_name)
    IlpMail.for(user, ilp, gmail).deliver!
    print "done!\n"
  end
end