require 'resque_scheduler'

Resque.redis = 'localhost:6379'
Resque.redis.namespace = "resque:SchedulerExample"

require File.join(Rails.root, 'app/jobs/poll_job.rb')

Resque.schedule = YAML.load_file(File.join(Rails.root, 'config/resque_scheduler.yml'))
