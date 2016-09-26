require 'focus_areas'

describe FocusAreas do
  let(:focus_area_list_path) { './spec/fixtures/focus_areas.txt' }
  let(:focus_area_factory) { double(:focus_area_factory) }

  describe '.build' do
    it 'fetches focus area text from a provided Focus Area list file' do
      expect(focus_area_factory).to receive(:build_from_text).exactly(7).times

      FocusAreas.build(focus_area_list_path, focus_area_factory)
    end
  end

  describe '#each' do
    it 'delegates iteration to an internal array' do
      allow(focus_area_factory).to receive(:build_from_text)
      focus_areas = FocusAreas.build(focus_area_list_path, focus_area_factory)

      expect(focus_areas).to delegate_method(:each).to(:all)
    end
  end
end