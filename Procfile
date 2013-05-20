redis: redis-server
scheduler: rake resque:scheduler
worker: rake resque:work QUEUE='*'
poll_queue: rake resque:work QUEUE=poll_queue
tweet_queue: rake resque:work QUEUE=tweet_queue
foursquare_queue: rake resque:work QUEUE=foursquare_queue
photo_queue: rake resque:work QUEUE=photo_queue
