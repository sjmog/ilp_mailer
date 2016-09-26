require_relative './user_factory'

class Users
  include Enumerable

  def initialize(responses, user_factory)
    @all = []
    @responses = responses
    @user_factory = user_factory
  end

  def self.build(list_path="./data/list.txt", user_factory = UserFactory)
    responses = File.open(list_path, 'rb').read
    new(responses, user_factory).build
  end

  def build
    @all = responses
      .each_line
      .inject([]) { |users, line| users << user_factory.build_from_line(line) }

    self
  end

  def each(&block)
    all.each(&block)
  end

  private

  attr_reader :responses, :user_factory, :all
end