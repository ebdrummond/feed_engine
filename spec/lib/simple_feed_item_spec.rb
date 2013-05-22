require 'spec_helper'

describe SimpleFeedItem do
  before(:each) do
    @item = SimpleFeedItem.new( { 'id' => 1,
                                  'text' => 'some text',
                                  'url' => 'the_url',
                                  'type' => 'twitter',
                                  'user' => 1,
                                  'action_at' => Time.now,
                                  'location' => 'somewhere' })
  end

  it 'renders the partial' do
    expect(@item.partial).to eq 'twitter'
  end
end