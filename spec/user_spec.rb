require_relative 'rails_helper'
RSpec.describe User, type: :model do
  before(:each) do
    @user1 = User.new(name:'joe' , email:"joe@gmail.com",:password => "testing123")
    @user1.save

    @user2 = User.new(name: 'nikki', email:"nikki@gmail.com",:password => "testing123")
    @user2.save

    @user3 = User.new(name: 'tony', email:"tony@gmail.com",:password => "testing123")
    @user3.save
  end

  context 'create new user' do

    it 'expects for user validity with all attributes' do
        @user5 = User.new(name: 'jay', email:"jay@gmail.com",:password => "testing123")
        @user5.save
      expect(@user5.valid?).to eq(true)
    end

    it 'expects for user invalidity with empty name' do
        @falseuser4 = User.new(name: '', email:"johny@gmail.com",:password => "testing123")
        @falseuser4.save
      expect(@falseuser4.valid?).to eq(false)
    end

    it 'expects for user invalidity with short name' do
        @falseuser4 = User.new(name: 'fa', email:"johny@gmail.com",:password => "testing123")
        @falseuser4.save
     expect(@falseuser4.valid?).to eq(false)
    end

    it 'expects for user invalidity with empty email' do
        @falseuser6 = User.new(name: 'jay', email:"")
        @falseuser6.save
      expect(@falseuser6.valid?).to eq(false)
    end

    it 'expects for user invalidity with empty password' do
        @falseuser7 = User.new(name: 'jay', email:"johny@gmail.com",:password => "")
        @falseuser7.save
      expect(@falseuser7.valid?).to eq(false)
    end

    it 'expects for user invalidity with short password' do
        @falseuser8 = User.new(name: 'jay', email:"johny@gmail.com",:password => "123")
        @falseuser8.save
      expect(@falseuser8.valid?).to eq(false)
    end

  end

end
