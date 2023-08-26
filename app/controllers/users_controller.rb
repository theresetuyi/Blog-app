class UsersController < ApplicationController
  before_action :set_current_user

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @current_user = @user
  end

  private

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
end
