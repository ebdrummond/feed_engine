web: bundle exec rails server -p $PORT
redis: redis-server
scheduler: rake resque:scheduler
worker: rake resque:work QUEUE='*'