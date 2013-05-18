require 'spec_helper'

describe 'User creates trip' do
  context 'after logging in' do
    before(:all) do
      # TODO: Way too much setup!  Isolate this somewhere so it's not duplicated everywhere
      OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
        :provider => 'twitter',
        :credentials => { :token => '123', :secret => 'abc' },
        :info => { :nickname => 'nick' },
        :uid => 'abc123'
      })

      user = User.create!(username: 'nick')
      user.auth_sources.create!(provider: 'twitter', token: 'abc', secret: '123', uid: 'abc123')
      visit root_path
      click_link 'Login with Twitter'
    end

    it 'from dashboard' do
      visit dashboard_path
      click_link 'Add Trip'
      fill_in 'trip[name]', with: "Phil's birthday getaway"
      fill_in 'trip[destination]', with: 'Sau Paulo, Brazil'
      fill_in 'trip[start]', with: '2013-07-15'
      fill_in 'trip[end]', with: '2013-07-22'

      click_button 'submit'
      expect(current_path).to eq dashboard_path
      expect(page).to have_content "Phil's birthday getaway"
    end
  end
end
