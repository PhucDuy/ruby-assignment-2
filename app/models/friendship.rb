class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, :class_name => 'User'
  scope :between, -> (current_user_id,friend_id) do
    where("(friendships.user_id = ? AND friendships.friend_id = ?)
    	OR (friendships.user_id = ? AND friendships.friend_id = ?)", current_user_id,friend_id, friend_id, current_user_id)
  end
end
