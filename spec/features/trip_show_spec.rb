require 'spec_helper'

describe 'User visits a trip show page' do
  context 'after logging in' do
    before(:all) do
      user = User.create!(username: 'nick')
      login(user)
    end
  end
end
