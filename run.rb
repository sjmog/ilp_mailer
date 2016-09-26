require 'gmail'
require './config'

Gmail.connect!(ENV["USERNAME"], ENV["PASSWORD"]) do |gmail|
  users = Users.build
  ilps = Ilp.all

  users.each { |user| user.mail(ilps) }
end