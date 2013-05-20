require 'resque_scheduler'

Resque.redis = ENV["REDISTOGO_URL"]
Resque.redis.namespace = "resque:SchedulerExample"

require File.join(Rails.root, 'app/jobs/poll_job.rb')

Resque.schedule = YAML.load_file(File.join(Rails.root, 'config/resque_scheduler.yml'))
Resque.after_fork = Proc.new { ActiveRecord::Base.establish_connection }