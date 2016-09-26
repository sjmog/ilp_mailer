require 'extract'

class Users
  def initialize(user_list, extract)
    @user_list = user_list
    @extract = extract
  end

  def self.build(list_path="./data/list.txt", extract = Extract.new)
    file = File.open(list_path, 'rb').read
    new(file, extract).build
  end

  def build
    user_list
      .each_line
      .inject([]) do |users, line|
        users << {
          name: extract.name(line),
          email: extract.email(line),
          focus_areas: extract.focus_areas(line)
        }
      end
  end

  private

  attr_reader :user_list, :extract
end