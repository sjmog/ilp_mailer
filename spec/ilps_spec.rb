require 'ilps'

describe Ilps do
  let(:ilp_list_path) { './spec/fixtures/ilps.txt' }
  let(:ilp_factory) { double(:ilp_factory) }

  describe '.build' do
    it 'fetches ilp text from a provided ILP list file' do
      expect(ilp_factory).to receive(:build_from_text).exactly(7).times

      Ilps.build(ilp_list_path, ilp_factory)
    end
  end

  describe '#each' do
    it 'delegates iteration to an internal array' do
      allow(ilp_factory).to receive(:build_from_text)
      ilps = Ilps.build(ilp_list_path, ilp_factory)

      expect(ilps).to delegate_method(:each).to(:all)
    end
  end
end