require_relative './ilp_factory'

class Ilps
  include Enumerable

  ILP_DELIMETER = "========"
  
  def initialize(ilps_file, ilp_factory)
    @all = []
    @ilps_file = ilps_file
    @ilp_factory = ilp_factory
  end

  def self.build(ilp_list_path="./data/ilps.txt", ilp_factory = IlpFactory)
    ilps_file = File.open(ilp_list_path, 'rb').read
    new(ilps_file, ilp_factory).build
  end

  def build
    @all = split_file_at_headers
      .inject([]) { |ilps, text| ilps << ilp_factory.build_from_text(text) }

    self
  end

  def each(&block)
    all.each(&block)
  end

  private

  attr_reader :ilps_file, :ilp_factory, :all

  def split_file_at_headers
    ilps_file.split(ILP_DELIMETER).map(&:strip)
  end
end