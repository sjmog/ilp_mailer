require 'users'

describe Users do
  let(:user_list_path) { './spec/fixtures/list.txt' }
  let(:user_factory) { double(:user_factory) }

  describe '.all' do
    it 'fetches user details from each line of a provided list' do
      expect(user_factory).to receive(:build_from_line).twice
      
      Users.build(user_list_path, user_factory)
    end
  end

  describe '#each' do
    it 'delegates iteration to an internal array' do
      allow(user_factory).to receive(:build_from_line)
      users = Users.build(user_list_path, user_factory)

      expect(users).to delegate_method(:each).to(:all)
    end
  end
end