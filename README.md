[![Code Climate](https://codeclimate.com/github/raphweiner/feed_engine.png)](https://codeclimate.com/github/raphweiner/feed_engine)

[![Build](https://travis-ci.org/raphweiner/feed_engine.png)](https://travis-ci.org/raphweiner/feed_engine)

[![Coverage](https://coveralls.io/repos/raphweiner/feed_engine/badge.png?branch=master)](https://coveralls.io/r/raphweiner/feed_engine?branch=master)

### Kreepr (aka Feed Engine)

The goal of this project was to practice consuming web service APIs as well as publishing an API. We created a Tumblr or Friendfeed-like system that lets users publish a timeline of activities that they have either created on the site or that are activity imported from another third-party site: Twitter, Foursquare or Instagram. In addition, we've provided an API for reading and writing to a user’s activity stream, and published a gem to let other application developers consume our API. The gem, Feed Burner, can be found [here](https://github.com/raphweiner/feed_burner)

Further project requirements can be on Jumpstart Lab's [Feed Engine page](http://tutorials.jumpstartlab.com/projects/feed_engine.html).

#### Traveline - A Family Travelogue

Families love to travel together, and Traveline lets you aggregate and save those memories. After creating an account on the site you can:

* Create a trip with start and end dates
* Connect a Twitter, Instagram, and Foursquare account
* Post notes to a trip from the app
* Invite others to join me on the trip
* View other user's public trips and private trips with an invitation

While on the trip, any events from third-party services are automatically added and visible both within the feed for that individual trip and my aggregate feed of all my trips.

#### Learning Goals

* Allow users to consume various third-party APIs where they hold accounts
* Publish an API, with accompanying client gem, and dog-food your API internally
* Coordinate with project stakeholders to produce quality code and product
* Continue to emphasize performance, UI, and overall user experience
* Continue using TDD to drive all layers of Rails development
