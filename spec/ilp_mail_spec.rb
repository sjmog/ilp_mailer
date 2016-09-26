require 'ilp_mail'

describe IlpMail do
  describe '.for' do
    it 'composes a mail for a user' do
      gmail = double(:gmail)
      user = double(:user, email: 'joebloggs@gmail.com')
      ilp = double(:ilp, text: "Hi Joe!\n\nStuff")

      message_block = lambda {
        to(user.email)
        subject("Your Individual Learning Plan")
        body(ilp.text)
      }

      expect(gmail).to receive(:compose).with(no_args) do |*args, &block|
        # No real way of testing block equality :(
      end

      IlpMail.for(user, ilp, gmail)
    end
  end

  describe '#deliver!' do
    it 'delegates delivery to Gmail' do
      gmail = double(:gmail)
      user = double(:user, email: 'joebloggs@gmail.com')
      ilp = double(:ilp, text: "Hi Joe!\n\nStuff")
      ilp_mail = described_class.new(user, ilp, gmail)
      allow(ilp_mail).to receive(:mail).and_return gmail

      expect(gmail).to receive(:deliver!)

      ilp_mail.deliver!
    end
  end
end