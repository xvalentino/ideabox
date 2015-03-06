require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "user can login with username and password" do
    User.create(username: "joe", password: "blow")
    visit login_path
    fill_in "session[username]", with: "joe"
    fill_in "session[password]", with: "blow"
    click_link_or_button "Log In"
    assert page.has_content?("Welcome, joe to your IdeaBox")
  end


end
