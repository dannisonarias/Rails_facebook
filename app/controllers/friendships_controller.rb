class FriendshipsController < ApplicationController
    def create
        @friendship = Friendship.new(user_id:current_user.id,friend_id:friendship_params[:friend_id])
        if @friendship.save
            flash[:success] = "friend request sent!"
            redirect_to users_path
        else
            flash[:warning] = "friend request failed!"
            redirect_to users_path
        end
    end

    def update
        @friendship = Friendship.find_by(user_id:current_user.id,friend_id:params[:friend_id])
        @friendship.confirmed = true
        if @friendship.save
            flash[:success] = "friend request accepted"
            redirect_to user_path
        else
            flash[:warning] = "error accepting friend request"
            redirect_to user_path
        end
    end

    def friendship_params
        params.permit(:friend_id)
    end
end
