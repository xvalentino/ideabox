class UsersController < ApplicationController
  before_filter :authorize

  def show
    @user = User.find(params[:id])
  end

  def authorize
    if current_user.nil?
      redirect_to login_path
      flash[:notice] = "Not authorized"
    end
  end

end
