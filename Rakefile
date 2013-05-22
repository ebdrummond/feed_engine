#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'resque/tasks'

FeedEngine::Application.load_tasks


namespace :users do
  desc "Populate some generic, random data for a user"
  task :populate_data => :environment do

    user = User.find_by_username(ENV['username']) || User.last
    puts "Generating data for #{user.username}"

    User.transaction do

      100.times do |index|
        current_time = Time.now.to_i

        user.tweets.create tweeted_at: Time.now,
          tweet_id: rand(100_000), 
          text: "I'm on top of the world. Join me in Bangkok! #{current_time}_#{index}"

        user.check_ins.create checked_in_at: Time.now,
          check_in_id: rand(100_000),
          text: "I love Chipotle. #{current_time}_#{index}",
          location: "Chipotle"
      end

    end

    # generate a bunch of foursquare items
  end
  
end