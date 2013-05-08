require 'spec_helper'

describe 'User signup' do
  it 'when successful redirects to dashboard' do
    visit root_path
    click_link_or_button 'Login'
    expect(current_path).to eq dashboard_path
  end

  it 'redirects to failure path with invalid credentials' do
    OmniAuth.config.mock_auth[:twitter] = :invalid_credentials

    visit root_path
    click_link_or_button 'Login'
    expect(current_path).to eq root_path
  end
end
