require 'spec_helper'

describe PollJob do
  before do
    ResqueSpec.reset!
  end

  describe '.perform' do
    xit 'queues ...' do
      PollJob.perform
      expect(PollJob).to have_queued
    end
  end
end
