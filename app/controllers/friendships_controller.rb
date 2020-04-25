class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(user_id: current_user.id, friend_id: friendship_params[:friend_id])
    if @friendship.save
      flash[:success] = 'friend request sent!'
    else
      flash[:warning] = 'friend request failed!'
    end
    redirect_to users_path
  end

  def update
    @friendship = Friendship.find_by(user_id: params[:friend_id].to_i, friend_id: current_user.id)
    @friendship[:confirmed] = true
    if @friendship.save
      flash[:success] = 'friend request accepted'
    else
      flash[:warning] = 'error accepting friend request'
    end
    redirect_to user_path
  end

  def friendship_params
    params.permit(:friend_id)
  end
end
