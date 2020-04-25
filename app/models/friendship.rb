class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  validates :user_id, exclusion: { in: ->(friendship) { [friendship.friend_id] } }
end
