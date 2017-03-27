require 'user_factory'

describe UserFactory do
  subject(:user_factory) { described_class.new(fixture_line, user_class) }
  let(:user_class) { double(:User) }

  describe '.build_from_line' do
    it 'pulls user details (name, email address, focus areas) from a line copied from Google Sheets' do
      user_data = { 
        name: "Joe", 
        email: "joebloggs@gmail.com", 
        focus_areas: ["Test-Driven Development", "Computational Thinking"] 
      }

      expect(user_class).to receive(:new).with(user_data)

      user_factory.build
    end

    it 'returns a useful error if there is a problem parsing the name' do
      user_factory = described_class.new(broken_name_line, user_class)

      expect { user_factory.build }.to raise_error RuntimeError, "Error parsing name from: #{broken_name_line}"
    end

    it 'returns a useful error if there is a problem parsing the email' do
      user_factory = described_class.new(broken_email_line, user_class)

      expect { user_factory.build }.to raise_error RuntimeError, "Error parsing email from: #{broken_email_line}"
    end
  end

  private

  def fixture_line
    "9/21/2016 17:22:27  Joe Bloggs  Test-Driven Development (e.g. test-first), Computational Thinking (e.g. breaking complex problems into small steps, reading code character-by-character, understanding what code does)  joebloggs@gmail.com Test-Driven Development (e.g. test-first   Computational Thinking (e.g. breaking complex problems into small steps, reading code character-by-character, understanding what code does)   "
  end

  def broken_name_line
    "3/22/2017 8:36:52 Joe Bloggs  Object-Oriented Programming (e.g. classes, methods, instance variables, Object-Oriented Design), Databases (e.g. persistence, tables, associations), Computational Thinking (e.g. breaking complex problems into small steps, reading code character-by-character, understanding what code does)  joebloggs@hotmail.com     "
  end

  def broken_email_line
    "3/22/2017 18:12:01  Joe Bloggs Test-Driven Development (e.g. test-first), The Web (e.g. client-server, request-response, controllers), Databases (e.g. persistence, tables, associations)  joebloggs|@gmail.com   "
  end
end