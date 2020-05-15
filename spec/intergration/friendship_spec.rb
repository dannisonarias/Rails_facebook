require_relative '../rails_helper'
RSpec.describe 'Friendships', type: :request do
  before(:each) do
    @user1 = User.create(name: 'joe', email: 'joe@gmail.com', password: 'testing', password_confirmation: 'testing')

    @user2 = User.create(name: 'nikki', email: 'nikki@gmail.com', password: 'testing123')

    @user3 = User.create(name: 'tony', email: 'tony@gmail.com', password: 'testing123')
  end

  it 'create new friendship, expects 2 rows to be added' do
    # add Devise::Test::IntegrationHelpers in rails config/rails helper to access "devise sign_in"
    sign_in @user1
    post '/friendships?friend_id=2'
    expect(Friendship.all.count).to eq(2)
  end
end
