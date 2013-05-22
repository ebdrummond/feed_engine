require 'spec_helper'

describe ApplicationHelper do
  describe '.auth_source_image_file' do
    it 'returns the image file name per event type' do
      expect(auth_source_image_file('tweet')).to eq "twitter_logo.svg"
      expect(auth_source_image_file('photo')).to eq "instagram_logo.jpg"
      expect(auth_source_image_file('check_in')).to eq "foursquare_logo.jpg"
    end
  end
end
