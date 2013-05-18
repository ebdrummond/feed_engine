require 'spec_helper'

describe 'User edits account' do
  context 'As a signed-in user visiting their account' do
    before(:all) do
      @user = User.create!(:username => 'Erin')
      login(@user)
      visit account_path
    end

    it 'is able to edit their username' do
      fill_in 'user_username', :with => 'ebdrummond'
      click_button 'Update Username'
      @user.reload
      expect(@user.username).to eq 'ebdrummond'
    end
  end

  context 'As an unauthenticated user' do
    it 'visiting the account page redirects to the dashboard' do
      visit account_path
      expect(current_path).to eq root_path
    end
  end
end
