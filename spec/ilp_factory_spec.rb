require 'ilp_factory'

describe IlpFactory do
  describe '.build_from_text' do
    it 'constructs an Ilp from given text' do
      ilp_class = double(:Ilp)

      expect(ilp_class).to receive(:new).with(title: "Foundations of Programming", body: "You need to focus on the basic structures of programming: state, behaviour, variables, functions. You\xE2\x80\x99ll be \xE2\x80\x98prepared\xE2\x80\x99 once you are comfortable solving mildly complex challenges using the core libraries of a coding language. Pick one (I suggest Ruby or JavaScript), and practice with that. Then switch to the other and practice with that. That way, you\xE2\x80\x99ll learn the abstract meanings behind the languages.\n\n1. Complete Codewars solutions up to and including 4kyu. When you submit a solution, investigate it. Understand why it works. Then re-submit your solution using that new method. It\xE2\x80\x99s okay to repeat challenges.")

      IlpFactory.build_from_text(fixture_text, ilp_class)
    end
  end

  def fixture_text
    "Foundations of Programming\n\nYou need to focus on the basic structures of programming: state, behaviour, variables, functions. You\xE2\x80\x99ll be \xE2\x80\x98prepared\xE2\x80\x99 once you are comfortable solving mildly complex challenges using the core libraries of a coding language. Pick one (I suggest Ruby or JavaScript), and practice with that. Then switch to the other and practice with that. That way, you\xE2\x80\x99ll learn the abstract meanings behind the languages.\n\n1. Complete Codewars solutions up to and including 4kyu. When you submit a solution, investigate it. Understand why it works. Then re-submit your solution using that new method. It\xE2\x80\x99s okay to repeat challenges.\n\n"
  end
end