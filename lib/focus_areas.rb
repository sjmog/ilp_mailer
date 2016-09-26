require_relative './focus_area_factory'

class FocusAreas
  include Enumerable

  FOCUS_AREA_DELIMETER = "========"
  
  def initialize(focus_areas_file, focus_area_factory)
    @all = []
    @focus_areas_file = focus_areas_file
    @focus_area_factory = focus_area_factory
  end

  def self.build(focus_area_list_path="./data/focus_areas.txt", focus_area_factory = IlpFactory)
    focus_areas_file = File.open(focus_area_list_path, 'rb').read
    new(focus_areas_file, focus_area_factory).build
  end

  def build
    @all = split_file_at_headers
      .inject([]) { |focus_areas, text| focus_areas << focus_area_factory.build_from_text(text) }

    self
  end

  def each(&block)
    all.each(&block)
  end

  private

  attr_reader :focus_areas_file, :focus_area_factory, :all

  def split_file_at_headers
    focus_areas_file.split(FOCUS_AREA_DELIMETER).map(&:strip)
  end
end