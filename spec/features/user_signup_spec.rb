require 'spec_helper'

describe 'User signup' do
  it 'can be accomplished with twitter' do
    visit root_path
    click_link_or_button 'Login'
    save_and_open_page
    expect(current_path).to eq dashboard_path
  end
end
