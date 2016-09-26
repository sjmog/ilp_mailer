require 'ilp'

describe Ilp do
  describe '.build' do
    it 'creates an ILP for the user given all the available focus areas' do
      user = double(:user, name: "Joe", focus_areas: ["Test-Driven Development"])
      tdd_focus_area = double(:focus_area, title: "Test-Driven Development", body: "Instructions go here.")
      focus_areas = [tdd_focus_area]

      expect(Ilp.build(user, focus_areas, "Samm").text).to eq sample_ilp
    end
  end

  private

  def sample_ilp
    "Hi Joe!\n\nThank you for completing the self-assessment form: here's an Individual Learning Plan to help you work on those areas that need some focus.\n\nTest-Driven Development\n\nInstructions go here.\n\nYours,\n\nSamm"
  end
end