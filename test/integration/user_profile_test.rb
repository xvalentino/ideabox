require_relative '../test_helper'

class UserProfileTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  attr_reader :user

  def setup
    @user = User.create(username: "karl", password: "marx")
  end

  test "registered user can view their profile" do
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit user_path(user)
    within("#banner") do
      assert page.has_content?("Welcome, karl to your IdeaBox")
    end
  end

  test "unregistered user cannot view a user's profile" do
    ApplicationController.any_instance.stubs(:current_user).returns(nil)
    visit user_path(user)
    within("#notice") do
      assert page.has_content?("Not authorized")
    end
  end



end
