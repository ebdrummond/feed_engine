class SimpleFeedItem

    attr_reader :id, :text, :url, :type, :user, :action_at, :location

    def partial
      type.to_s
    end

    def initialize(params)
      @id = params['id']
      @text = params['text']
      @url = params['url']
      @type = params['type'].to_sym
      @user = params['user']
      @action_at = params['action_at']
      @location = params['location']
    end

    def self.dashboard_query(offset)
      %{SELECT tweets.user_id as user_id, tweets.id as id, tweets.text as text, "tweet" as type, "" as url, "" as location, tweets.tweeted_at as action_at
      FROM users
      JOIN tweets ON users.id = tweets.user_id
      WHERE users.id = (SELECT user_trips.user_id
      FROM user_trips
      WHERE trip_id IN (SELECT user_trips.id FROM user_trips WHERE user_trips.user_id = 2))
      
      UNION ALL
      
      SELECT photos.user_id as user_id, photos.id as id, photos.caption as text, "photo" as type, photos.url, "" as location, photos.taken_at as action_at
      FROM users
      JOIN photos ON users.id = photos.user_id
      WHERE users.id = (SELECT user_trips.user_id
      FROM user_trips
      WHERE trip_id IN (SELECT user_trips.id FROM user_trips WHERE user_trips.user_id = 2))
      
      UNION ALL
      
      SELECT check_ins.user_id as user_id, check_ins.id as id, check_ins.text as text, "check_in" as type, "" as url, check_ins.location as location, check_ins.checked_in_at as action_at
      FROM users
      JOIN check_ins ON users.id = check_ins.user_id
      WHERE users.id = (SELECT user_trips.user_id
      FROM user_trips
      WHERE trip_id IN (SELECT user_trips.id FROM user_trips WHERE user_trips.user_id = 2))

      ORDER BY action_at DESC
      LIMIT 25
      OFFSET #{offset}
      }
    end

    alias_method :event_created_at, :action_at

  end