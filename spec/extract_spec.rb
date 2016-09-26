require 'user_factory'

describe UserFactory do
  subject(:user_factory) { described_class.new(fixture_line, user_class) }
  let(:user_class) { double(:User) }

  it 'knows the possible focus areas' do
    expect(described_class::POSSIBLE_FOCUS_AREAS).not_to be_nil
  end

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
  end

  private

  def fixture_line
    "9/21/2016 17:22:27  Joe Bloggs  Test-Driven Development (e.g. test-first), Computational Thinking (e.g. breaking complex problems into small steps, reading code character-by-character, understanding what code does)  joebloggs@gmail.com Test-Driven Development (e.g. test-first   Computational Thinking (e.g. breaking complex problems into small steps, reading code character-by-character, understanding what code does)   "
  end
end