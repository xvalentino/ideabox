require 'test_helper'

class IdeasTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "user has ideas" do
    User.ideas.new(title: "new idea", description: "do things" )
  end
end