user1 = User.create(:username => "ebdrummond", :avatar => "https://secure.gravatar.com/avatar/1496e3ed86352ccb1a62c086b2058365?s=420&d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png")
auth_source1 = user1.auth_sources.create(:token => "205086968-3zteV0ycZcL7kZDTpSDk8VRb386g7Zc0RphDTME6", :secret => "0ElId8rpfipu2uSUPvuZRqmsDu2xYxpJPdrwEpq4bI", :uid => "205086968", :provider => "twitter")
user2 = User.create(:username => "sussinct", :avatar => "https://secure.gravatar.com/avatar/e7f253b4d265e9928f564c80207ad5b7?s=420&d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png")
user3 = User.create(:username => "raphie", :avatar => "https://secure.gravatar.com/avatar/fa745bc50d39d5f6ec352106273a8f51?s=420&d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png")
user4 = User.create(:username => "phil-er-up", :avatar => "https://secure.gravatar.com/avatar/89c173a60fd20adf2e746267597dab20?s=420&d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png")
user5 = User.create(:username => "comic-girl", :avatar => "http://splashpage.mtv.com/wp-content/uploads/2010/03/032410_guild.jpg")
user6 = User.create(:username => "time-mag", :avatar => "https://si0.twimg.com/profile_images/3656458804/8513bad06d749c883e31b0ce70da2a95.jpeg")
user7 = User.create(:username => "kale_lvr", :avatar => "http://2.bp.blogspot.com/-caQ42Yk_fIg/TudWOoPS-8I/AAAAAAAACBg/QKuy9y0-iV0/s1600/eat-more-kale-sticker.gif")
user8 = User.create(:username => "irish-burrito", :avatar => "http://www.ladecostified.com/wp-content/uploads/2010/03/Ireland_flag-300x200.gif")
user9 = User.create(:username => "no-off", :avatar => "http://www.luisbelerique.com/folio/works/tony_stark_lb.jpg")
user10 = User.create(:username => "birder", :avatar => "http://teresamakesthings.files.wordpress.com/2012/03/birdstencil.jpg")
user11 = User.create(:username => "mexico", :avatar => "http://www.vectors4all.net/preview/cartoon-goat-clip-art.jpg")
user12 = User.create(:username => "canada", :avatar => "http://openclipart.org/people/StudioFibonacci/lemmling_Cartoon_moose.svg")
user13 = User.create(:username => "marcy", :avatar => "http://s3.amazonaws.com/c3po_store_engine/images/8/large.png?1365052494")


trip1 = user1.trips.create(:name => "Portlandia", :destination => "Portland, Oregon", :start => "2013-05-01", :end => "2013-05-04")
ut1 = user1.user_trips.create(:trip_id => trip1.id, :trip_role => "traveler")
ut2 = user2.user_trips.create(:trip_id => trip1.id, :trip_role => "traveler")
ut3 = user10.user_trips.create(:trip_id => trip1.id, :trip_role => "traveler")
ut4 = user13.user_trips.create(:trip_id => trip1.id, :trip_role => "kreepr")
ut5 = user7.user_trips.create(:trip_id => trip1.id, :trip_role => "kreepr")
tweet1 = Tweet.create(:tweeted_at => "2013-05-01 02:52:23", :tweet_id => "gschool1", :text => "Just landed in Portland!  So glad to be back :)", :user_id => user1.id)
tweet2 = Tweet.create(:tweeted_at => "2013-05-01 03:52:23", :tweet_id => "gschool2", :text => "@ebdrummond @birder meet you at Bridgeport for a drink in an hour?", :user_id => user2.id)
tweet3 = Tweet.create(:tweeted_at => "2013-05-01 03:52:23", :tweet_id => "gschool3", :text => "@sussinct @birder sounds good!", :user_id => user1.id)


trip2 = user3.trips.create(:name => "Vegas Baby!", :destination => "Las Vegas, Nevada", :start => "2013-05-04", :end => "2013-05-10")
ut5 = user3.user_trips.create(:trip_id => trip2.id, :trip_role => "traveler")
ut6 = user4.user_trips.create(:trip_id => trip2.id, :trip_role => "traveler")
ut7 = user8.user_trips.create(:trip_id => trip2.id, :trip_role => "traveler")
ut8 = user7.user_trips.create(:trip_id => trip2.id, :trip_role => "traveler")
ut9 = user11.user_trips.create(:trip_id => trip2.id, :trip_role => "kreepr")
ut10 = user9.user_trips.create(:trip_id => trip2.id, :trip_role => "kreepr")
ut11 = user2.user_trips.create(:trip_id => trip2.id, :trip_role => "kreepr")

trip3 = user12.trips.create(:name => "Oh Canada", :destination => "Saskatoon", :start => "2013-05-07", :end => "2013-05-14")
ut12 = user12.user_trips.create(:trip_id => trip3.id, :trip_role => "traveler")
ut13 = user11.user_trips.create(:trip_id => trip3.id, :trip_role => "traveler")
ut14 = user1.user_trips.create(:trip_id => trip3.id, :trip_role => "kreepr")

trip4 = user10.trips.create(:name => "Put a bird on it!", :destination => "Estes Park, Colorado", :start => "2013-05-08", :end => "2013-05-10")
ut15 = user5.user_trips.create(:trip_id => trip4.id, :trip_role => "traveler")
ut16 = user3.user_trips.create(:trip_id => trip4.id, :trip_role => "kreepr")

trip5 = user9.trips.create(:name => "Jamaica", :destination => "Kingston, Jamaica", :start => "2013-05-10", :end => "2013-05-17")
ut17 = user9.user_trips.create(:trip_id => trip5.id, :trip_role => "traveler")
ut18 = user1.user_trips.create(:trip_id => trip5.id, :trip_role => "kreepr")
ut19 = user8.user_trips.create(:trip_id => trip5.id, :trip_role => "kreepr")
ut20 = user2.user_trips.create(:trip_id => trip5.id, :trip_role => "kreepr")
ut21 = user4.user_trips.create(:trip_id => trip5.id, :trip_role => "kreepr")
ut22 = user10.user_trips.create(:trip_id => trip5.id, :trip_role => "kreepr")

trip6 = user2.trips.create(:name => "Summer Vacation", :destination => "San Francisco", :start => "2013-05-15", :end => "2013-05-22")
trip6.visible = true
trip6.save
ut23 = user2.user_trips.create(:trip_id => trip6.id, :trip_role => "traveler")
ut24 = user4.user_trips.create(:trip_id => trip6.id, :trip_role => "traveler")
ut25 = user3.user_trips.create(:trip_id => trip6.id, :trip_role => "traveler")
ut26 = user1.user_trips.create(:trip_id => trip6.id, :trip_role => "traveler")







