class Ilp
  attr_reader :text

  def initialize(user, focus_areas, coach_name)
    @user = user
    @focus_areas = focus_areas
    @coach_name = coach_name
  end

  def self.build(user, focus_areas, coach_name)
    new(user, focus_areas, coach_name).build
  end

  def build
    @text = [ :salutation,
      :intro,
      :body,
      :signoff
    ].inject("") do |text, method|
      text << self.send(method)
    end

    self
  end

  private
  attr_reader :user, :focus_areas, :coach_name

  def salutation
    "Hi #{ user.name }!\n\n"
  end

  def intro
    "Thank you for completing the self-assessment form: here's an Individual Learning Plan to help you work on those areas that need some focus.\n\n"
  end

  def body
    focus_areas.inject("") do |body, focus_area|
      body << "#{ focus_area.title }\n\n#{ focus_area.body }\n\n" if user.focus_areas.include? focus_area.title
    end
  end

  def signoff
    "Yours,\n\n#{ coach_name }"
  end
end