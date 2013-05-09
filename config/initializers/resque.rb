require 'resque_scheduler'

# Resque.redis = 'localhost:6379'
# Resque.redis.namespace = "resque:SchedulerExample"

# Dir["#{Rails.root}/app/jobs/*.rb"].each { |file| require file }

Resque.schedule = YAML.load_file(File.join(Rails.root, 'config/resque_scheduler.yml'))