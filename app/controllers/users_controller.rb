class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_friends, only: :show

  def index
    @users = User.all.includes(:friendships).to_a
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end
end
