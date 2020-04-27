require_relative '../rails_helper'
require_relative '../spec_helper'

RSpec.describe Friendship, type: :model do
  describe 'friend request process', type: :feature do
    before :each do
      @user1 = User.new(name: 'joe', email: 'joe@gmail.com', password: 'testing123')
      @user1.save

      @user2 = User.new(name: 'nikki', email: 'nikki@gmail.com', password: 'testing123')
      @user2.save

      @user3 = User.new(name: 'tony', email: 'tony@gmail.com', password: 'testing123')
      @user3.save

      @friendship = Friendship.new(user_id: @user1.id, friend_id: @user3.id)
      @friendship.save
    end

    it 'sends friend request and expects receiver to recieve it' do
      visit new_user_session_path
      fill_in 'user[email]', with: @user3[:email]
      fill_in 'user[password]', with: 'testing123'
      click_button(value: 'Log in')
      visit user_path @user3
      expect(page).to have_content 'Accept Friend Request'
    end

    it 'sends friend request and expects receiver to recieve it' do
      visit new_user_session_path
      fill_in 'user[email]', with: @user3[:email]
      fill_in 'user[password]', with: 'testing123'
      click_button(value: 'Log in')
      visit user_path @user3
      expect(page).to have_content 'Decline Friend Request'
    end

    it 'sends friend request and expects receiver to decline it' do
      visit new_user_session_path
      fill_in 'user[email]', with: @user3[:email]
      fill_in 'user[password]', with: 'testing123'
      click_button(value: 'Log in')
      visit user_path @user3
      click_link('Decline Friend Request')
      expect(page).should have_no_content 'Decline Friend Request'
    end
  end
end
