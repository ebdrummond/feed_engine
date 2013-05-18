require 'spec_helper'

describe TwitterJob do
  before do
    ResqueSpec.reset!
  end

  describe '.perform' do
    xit 'queues ...' do
      TwitterJob.perform
      expect(TwitterJob).to have_queued
    end
  end
end
