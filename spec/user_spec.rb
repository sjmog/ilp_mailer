require 'users'

describe Users do
  let(:user_list_path) { './spec/fixtures/list.txt' }
  let(:extract) { double(:extract) }

  describe '.all' do
    it 'fetches user details from each line of a provided list' do
      expect(extract).to receive(:name).twice
      expect(extract).to receive(:email).twice
      expect(extract).to receive(:focus_areas).twice
      
      Users.build(user_list_path, extract)
    end
  end
end

# ({ name: "Joe Bloggs", email: "joebloggs@emails.com", focus_areas: ["TDD", "OOP", "The Web"] })