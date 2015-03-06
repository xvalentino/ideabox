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

  test "user cannot login without username and password" do
    User.create(username: "nil", password: "nil")
    visit login_path
    click_link_or_button "Log In"
    assert page.has_content?("Invalid Login")
  end

  test "registered user can logout" do
    user = User.create(username: "joe", password: "blow")
    visit login_path
    fill_in "session[username]", with: "joe"
    fill_in "session[password]", with: "blow"
    click_link_or_button "Log In"
    visit user_path(user)
    click_link_or_button("Log Out")
    assert page.has_content?("Successfully Logged Out!")
  end


end
