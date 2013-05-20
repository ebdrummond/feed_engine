web: bundle exec rails server -p $PORT
scheduler: rake resque:scheduler
worker: rake resque:work QUEUE='*'