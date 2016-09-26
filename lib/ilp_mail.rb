require 'gmail'

class IlpMail
  def initialize(user, ilp, gmail) 
    @user = user
    @ilp = ilp
    @gmail = gmail
  end

  def self.for(user, ilp, gmail)
    new(user, ilp, gmail).build
  end

  def build
    email = user.email
    body = ilp.text

    @mail = gmail.compose do
      to(email)
      subject("Your Individual Learning Plan")
      body(body)
    end
  end

  def deliver!
    mail.deliver!
  end

  private
  attr_reader :user, :ilp, :gmail, :mail
end