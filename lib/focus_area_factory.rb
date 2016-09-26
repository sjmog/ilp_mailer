require_relative './focus_area'

class FocusAreaFactory
  def initialize(text, focus_area_class)
    @text = text
    @focus_area_class = focus_area_class
  end

  def self.build_from_text(text, focus_area_class = FocusArea)
    new(text, focus_area_class).build
  end

  def build
    focus_area_class.new(
      title: title,
      body: body
    )
  end

  private

  attr_reader :text, :focus_area_class

  def title
    text.strip.split(/\n/).first
  end

  def body
    text.sub(title, '').strip
  end
end