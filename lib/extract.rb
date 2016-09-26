class Extract
  POSSIBLE_FOCUS_AREAS = [
    "Foundations of Programming",
    "Test-Driven Development",
    "Object-Oriented Programming",
    "The Web",
    "Databases",
    "Computational Thinking",
    "XP Values"
  ]

  def name(line)
    line.scan(/\d\s{2}(\w+)/)[0][0]
  end

  def email(line)
    line.scan(/([a-zA-Z0-9_\-\.]+@[a-zA-Z0-9_\-\.]+\.[a-zA-Z]{2,5})/)[0][0]
  end

  def focus_areas(line)
    POSSIBLE_FOCUS_AREAS.inject([]) do |focus_areas, focus_area|
      focus_areas.tap { |areas| areas << focus_area if line.include? focus_area } 
    end
  end
end