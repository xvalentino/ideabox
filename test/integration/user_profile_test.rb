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

  test "registered user cannot view other users' profile" do
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    protected_user = User.create(username: "protectmeplz",  password: "password", password_confirmation: "password")
    visit user_path(protected_user)
    # save_and_open_page
    within("#notice") do
      assert page.has_content?("You are NOT authorized to access this page")
    end
  end

  test "an admin can view any user's profile" do
    admin_user = User.create(username: "admin", password: "hammer", password_confirmation: "hammer", role: "admin")
    ApplicationController.any_instance.stubs(:current_user).returns(admin_user)
    visit user_path(user)
    within("#banner") do
      assert page.has_content?("Welcome, karl to your IdeaBox")
    end
  end



end
