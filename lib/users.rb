require_relative './user_factory'

class Users
  def initialize(responses, user_factory)
    @responses = responses
    @user_factory = user_factory
  end

  def self.build(list_path="./data/list.txt", user_factory = UserFactory)
    responses = File.open(list_path, 'rb').read
    new(responses, user_factory).build
  end

  def build
    responses
      .each_line
      .inject([]) { |users, line| users << user_factory.build_from_line(line) }
  end

  private

  attr_reader :responses, :user_factory
end