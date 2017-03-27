require_relative './user'

class UserFactory
  def initialize(line, user_class)
    @line = line
    @user_class = user_class
  end

  def self.build_from_line(line, user_class = User)
    new(line, user_class).build
  end

  def build
    user_class.new(
      name: name,
      email: email,
      focus_areas: focus_areas
    )
  end

  private

  attr_reader :line, :user_class

  def name
    line.scan(/\d\s{2}(\w+)/)[0][0]
  rescue
    raise "Error parsing name from #{line}"
  end

  def email
    line.scan(/([a-zA-Z0-9_\-\.]+@[a-zA-Z0-9_\-\.]+\.[a-zA-Z]{2,5})/)[0][0]
  rescue
    raise "Error parsing email from: #{line}"
  end

  def focus_areas
    ::POSSIBLE_FOCUS_AREAS.inject([]) do |focus_areas, focus_area|
      focus_areas.tap { |areas| areas << focus_area if line.include? focus_area } 
    end
  end
end