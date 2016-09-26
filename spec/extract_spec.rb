require 'extract'

describe Extract do
  subject(:extract) { described_class.new }

  it 'knows the possible focus areas' do
    expect(described_class::POSSIBLE_FOCUS_AREAS).not_to be_nil
  end

  describe '#name' do
    it 'pulls the name from a line copied from Google Sheets' do
      expect(extract.name(fixture_line)).to eq "Joe"
    end
  end

  describe '#email' do
    it 'pulls the email address from a line copied from Google Sheets' do
      expect(extract.email(fixture_line)).to eq "joebloggs@gmail.com"
    end
  end

  describe '#focus_areas' do
    it 'pulls the focus areas from a line copied from Google Sheets' do
      expect(extract.focus_areas(fixture_line)).to eq ["Test-Driven Development", "Computational Thinking"]
    end
  end

  private

  def fixture_line
    "9/21/2016 17:22:27  Joe Bloggs  Test-Driven Development (e.g. test-first), Computational Thinking (e.g. breaking complex problems into small steps, reading code character-by-character, understanding what code does)  joebloggs@gmail.com Test-Driven Development (e.g. test-first   Computational Thinking (e.g. breaking complex problems into small steps, reading code character-by-character, understanding what code does)   "
  end
end