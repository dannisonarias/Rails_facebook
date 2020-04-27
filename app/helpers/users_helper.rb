module UsersHelper
  def pending_friend?(user)
    current_user.pending_friends.include?(user) || current_user.friend_requests.include?(user)
  end
end
