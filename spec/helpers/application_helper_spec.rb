require 'spec_helper'

describe ApplicationHelper do
  describe '.auth_source_image_file' do
    it 'returns the image file name per event type' do
      expect(auth_source_image_file('tweet')).to eq "twitter-gray.png"
      expect(auth_source_image_file('photo')).to eq "instagram-128.png"
      expect(auth_source_image_file('check_in')).to eq "Foursquare-icon-gray.png"
      expect(auth_source_image_file('note')).to eq "pencil_64.png"
    end
  end
end
