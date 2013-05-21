require 'spec_helper'

describe 'User visits a trip show page' do
  context 'after logging in' do
    before(:all) do
      user = User.create!(username: 'nick')
      login(user)
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