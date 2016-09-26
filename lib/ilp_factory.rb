require_relative './ilp'

class IlpFactory
  def initialize(text, ilp_class)
    @text = text
    @ilp_class = ilp_class
  end

  def self.build_from_text(text, ilp_class = Ilp)
    new(text, ilp_class).build
  end

  def build
    ilp_class.new(
      title: title,
      body: body
    )
  end

  private

  attr_reader :text, :ilp_class

  def title
    text.strip.split(/\n/).first
  end

  def body
    text.sub(title, '').strip
  end
end