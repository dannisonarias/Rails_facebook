class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(user_id: current_user.id, friend_id: friendship_params[:friend_id])
    # @reverse_friendship = Friendship.new(friend_id: current_user.id, user_id: friendship_params[:friend_id])
    if @friendship.valid?
      @friendship.save
    else
      flash[:warning] = 'Error sending friend request'
    end
    redirect_to users_path
  end

  def update
    @friendship = Friendship.find_by(user_id: params[:friend_id].to_i, friend_id: current_user.id)
    if current_user.confirm_friend(@friendship.user.id)
      flash[:success] = 'friend request accepted'
    else
      flash[:warning] = 'error accepting friend request'
    end
    redirect_to user_path
  end

  def destroy
    @friendship = Friendship.find_by(user_id: params[:friend_id].to_i, friend_id: current_user.id)
    if @friendship.delete
      flash[:success] = 'friend request declined'
    else
      flash[:warning] = 'error declining friend request'
    end
    redirect_to user_path
  end

  private

  def friendship_params
    params.permit(:friend_id)
  end
end
