require_relative 'rails_helper'
RSpec.describe Friendship, type: :model do
  before(:each) do
    @user1 = User.create(name: 'joe', email: 'joe@gmail.com', password: 'testing123')

    @user2 = User.create(name: 'nikki', email: 'nikki@gmail.com', password: 'testing123')

    @user3 = User.create(name: 'tony', email: 'tony@gmail.com', password: 'testing123')
  end

  context 'create new friendships' do
    it 'expects friendship to be valid' do
      @friendship = Friendship.new(user_id: @user1.id, friend_id: @user2.id)
      expect(@friendship.valid?).to eq(true)
    end

    it 'expects friendship to be invalid with empty user id' do
      @friendship = Friendship.new(user_id: '', friend_id: @user1.id)
      expect(@friendship.valid?).to eq(false)
    end

    it 'expects friendship to be invalid with empty friend id' do
      @friendship = Friendship.new(user_id: @user1.id, friend_id: '')
      expect(@friendship.valid?).to eq(false)
    end

    it 'expects friendship to be invalid when user_id = friend_id' do
      @friendship = Friendship.new(user_id: @user1.id, friend_id: @user1.id)
      expect(@friendship.valid?).to eq(false)
    end

    it 'sends friend request and expects to have a pending friend' do
      @friendship = Friendship.create(user_id: @user1.id, friend_id: @user2.id)
      expect(@user1.pending_friends.first).to be_truthy
    end

    it 'receives friend request and expects to have a friend request' do
      @friendship = Friendship.create(user_id: @user1.id, friend_id: @user2.id)
      expect(@user2.friend_requests.first).to be_truthy
    end

    it 'sends friend request and expects reverse friendship(2-row-friendship)' do
      @friendship = Friendship.create(user_id: @user1.id, friend_id: @user2.id)
      expect(@user2.friend_requests.first).to be_truthy
    end
  end
end
