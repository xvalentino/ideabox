require 'test_helper'

class IdeasTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "user has ideas" do
    user = User.new
    user.ideas.new(title: "new idea", description: "do things" )
  end

  test "there is an ideas page dependent on the users ideas" do 
    user = User.create(username: "tino", password: "poop")
    user.ideas.create(title: "idea", description: "stuff")
    visit login_path
    fill_in "session[username]", with: "tino"
    fill_in "session[password]", with: "poop"
    click_link_or_button "Log In"
    assert page.has_content?("tino")
    assert page.has_content?("idea")
  end
end
