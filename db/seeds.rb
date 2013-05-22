# User1 - Erin: ACTUAL DATA
user1 = User.create(:username => "ebdrummond", :avatar => "https://secure.gravatar.com/avatar/1496e3ed86352ccb1a62c086b2058365?s=420&d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png")
auth_source1 = user1.auth_sources.create(:token => "205086968-3zteV0ycZcL7kZDTpSDk8VRb386g7Zc0RphDTME6", :secret => "0ElId8rpfipu2uSUPvuZRqmsDu2xYxpJPdrwEpq4bI", :uid => "205086968", :provider => "twitter")
key1 = ApiKey.new
key1.user_id = user1.id
key1.key = "045f3223-33c3-4562-94a5-0c2f0dbe67be"
key1.save

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

# Trip 1 - Portland with Erin, Laura, Kyle
trip1 = user1.trips.create(:name => "Portlandia", :destination => "Portland, Oregon", :start => "2013-05-01", :end => "2013-05-04")
ut1 = user1.user_trips.create(:trip_id => trip1.id, :trip_role => "traveler")
ut2 = user2.user_trips.create(:trip_id => trip1.id, :trip_role => "traveler")
ut3 = user10.user_trips.create(:trip_id => trip1.id, :trip_role => "traveler")
ut4 = user13.user_trips.create(:trip_id => trip1.id, :trip_role => "kreepr")
ut5 = user7.user_trips.create(:trip_id => trip1.id, :trip_role => "kreepr")
ut6 = user8.user_trips.create(:trip_id => trip1.id, :trip_role => "kreepr")
ut7 = user5.user_trips.create(:trip_id => trip1.id, :trip_role => "kreepr")
ut8 = user12.user_trips.create(:trip_id => trip1.id, :trip_role => "kreepr")
ut9 = user4.user_trips.create(:trip_id => trip1.id, :trip_role => "kreepr")

tweet1 = Tweet.create(:tweeted_at => "2013-05-01 02:52:23", :tweet_id => "gschool1", :text => "Just landed in Portland!  So glad to be back :)", :user_id => user1.id)
tweet2 = Tweet.create(:tweeted_at => "2013-05-01 03:52:23", :tweet_id => "gschool2", :text => "@ebdrummond @birder meet you at Bridgeport for a drink in an hour?", :user_id => user2.id)
tweet3 = Tweet.create(:tweeted_at => "2013-05-01 03:54:23", :tweet_id => "gschool3", :text => "@sussinct @birder sounds good!", :user_id => user1.id)
checkin1 = CheckIn.create(:checked_in_at => "2013-05-01 05:07:23", :check_in_id => "gschool4", :venue => Hashie::Mash.new({"id"=>"gschool4", "name"=>"Bridgeport Brewing Company", "contact"=>{"phone"=>"5032413612", "formattedPhone"=>"(503) 241-3612"}, "location"=>{"address"=>"1313 NW Marshall Street", "postalCode"=>"97209", "city"=>"Portland", "state"=>"OR", "country"=>"United States", "cc"=>"US"}, "canonicalUrl"=>"https://foursquare.com/v/bridgeport-brewery--brewpub/40b13b00f964a52054f51ee3"}), :user_id => user2.id)
photo1 = Photo.create(:taken_at => "2013-05-01 05:35:23", :photo_id => "gschool5", :caption => "this beer is so good!", :user_id => user10.id, :url => "http://s3-media1.ak.yelpcdn.com/bphoto/xvMqh1cmaS9gXqWd99TCwg/l.jpg")
photo2 = Photo.create(:taken_at => "2013-05-01 07:45:19", :photo_id => "gschool6", :caption => "haha... keep Portland weird indeed!", :user_id => user1.id, :url => "http://onlyinthiscity.org/wp-content/uploads/2012/05/Darth-Vader-Playing-The-Bagpipes-While-Riding-A-Unicycle.jpg")
checkin2 = CheckIn.create(:checked_in_at => "2013-05-01 09:38:23", :check_in_id => "gschool7", :venue => Hashie::Mash.new({"id"=>"gschool7", "name"=>"Doug Fir Lounge", "contact"=>{"phone"=>"5032319663", "formattedPhone"=>"(503) 231-9663"}, "location"=>{"address"=>"830 E Burnside St", "postalCode"=>"97214", "city"=>"Portland", "state"=>"OR", "country"=>"United States", "cc"=>"US"}, "canonicalUrl"=>"https://foursquare.com/v/doug-fir-lounge/43ba6040f964a520e62c1fe3"}), :user_id => user2.id, :text => "Hope this band is good.  Haven't heard of them yet.  Birches & Binary?")
tweet4 = Tweet.create(:tweeted_at => "2013-05-01 11:52:24", :tweet_id => "gschool8", :text => "Well, Birches & Binary is turning out to be pretty good, but man I am beat.", :user_id => user1.id)
photo3 = Photo.create(:taken_at => "2013-05-01 011:57:19", :photo_id => "gschool9", :caption => "goodnight Portland!", :user_id => user10.id, :url => "http://api.ning.com/files/phxkX8gfqaSDBo1hJX7tKTJu686cNw2Rqz36uFk20ILSahMhF8-G0sr2df6SNzVwKo1NjiCbBCAqaDg4Im9NLQjcarhszoX9/SchnitzerAtNightFrontWMC.jpg")
checkin3 = CheckIn.create(:checked_in_at => "2013-05-02 09:38:23", :check_in_id => "gschool10", :venue => Hashie::Mash.new({"id"=>"gschool10", "name"=>"Voodoo Doughnut", "contact"=>{"phone"=>"5032414704", "formattedPhone"=>"(503) 241-4704"}, "location"=>{"address"=>"22 SW 3rd Ave", "postalCode"=>"97204", "city"=>"Portland", "state"=>"OR", "country"=>"United States", "cc"=>"US"}, "canonicalUrl"=>"https://foursquare.com/v/voodoo-doughnut/42829c80f964a5201b221fe3"}), :user_id => user1.id, :text => "Yum!!!")
tweet5 = Tweet.create(:tweeted_at => "2013-05-02 9:42:52", :tweet_id => "gschool11", :text => "Hardest part about eating at @VoodooDoughnut: picking just one.", :user_id => user2.id)
photo4 = Photo.create(:taken_at => "2013-05-02 09:43:19", :photo_id => "gschool12", :caption => "the line at Voodoo is out of control", :user_id => user10.id, :url => "http://oregonnvc.files.wordpress.com/2010/02/voodoodonut1.jpg")
tweet6 = Tweet.create(:tweeted_at => "2013-05-02 9:45:52", :tweet_id => "gschool13", :text => "Lovely day for kayaking with @ebdrummond and @birder.  If you're in Portland and feel up to it, join us!", :user_id => user2.id)
tweet7 = Tweet.create(:tweeted_at => "2013-05-02 9:46:52", :tweet_id => "gschool14", :text => "The eternal dilemma... leave the phone in a locker, or bring it for pictures and risk destroying it.", :user_id => user2.id)
checkin4 = CheckIn.create(:checked_in_at => "2013-05-02 09:48:23", :check_in_id => "gschool15", :venue => Hashie::Mash.new({"id"=>"gschool15", "name"=>"Alder Creek Kayak and Canoe", "contact"=>{"phone"=>"5032851819", "formattedPhone"=>"(503) 285-1819"}, "location"=>{"address"=>"1515 SE Water Ave", "postalCode"=>"97214", "city"=>"Portland", "state"=>"OR", "country"=>"United States", "cc"=>"US"}, "canonicalUrl"=>"https://foursquare.com/v/alder-creek-kayak--canoe/4b25ca6ef964a520407624e3"}), :user_id => user10.id)
photo5 = Photo.create(:taken_at => "2013-05-02 09:49:19", :photo_id => "gschool16", :caption => "lovely day :)", :user_id => user1.id, :url => "http://www.discoverportland.net/images/stories/2011_photos/Portland-Kayak-Company.jpg")
photo6 = Photo.create(:taken_at => "2013-05-02 09:50:19", :photo_id => "gschool17", :caption => "I love this city", :user_id => user2.id, :url => "http://www.portlandkayak.com/prcwebpics/Ross%20Island%20Gallery/024_2A.JPG")
photo7 = Photo.create(:taken_at => "2013-05-02 09:51:19", :photo_id => "gschool18", :caption => "Decided to stop by the OMSI to check out the submarine.  Erin doesn't like it.", :user_id => user10.id, :url => "http://media.tumblr.com/tumblr_ls3k4e2NYt1r0fv3u.jpg")
tweet8 = Tweet.create(:tweeted_at => "2013-05-02 9:52:52", :tweet_id => "gschool19", :text => "Well... I guess a career in the Navy is out.  Those subs are way too claustrophobic!", :user_id => user1.id)
tweet9 = Tweet.create(:tweeted_at => "2013-05-02 9:54:52", :tweet_id => "gschool20", :text => "Off to check out the rose test garden.  Bet there will be some awesome birds there!", :user_id => user10.id)
tweet10 = Tweet.create(:tweeted_at => "2013-05-02 9:55:52", :tweet_id => "gschool21", :text => "I just need to point out there is a variety of rose here named David Bowie.", :user_id => user1.id)
checkin5 = CheckIn.create(:checked_in_at => "2013-05-02 09:56:23", :check_in_id => "gschool22", :venue => Hashie::Mash.new({"id"=>"gschool22", "name"=>"International Rose Test Garden", "contact"=>{"phone"=>"5032277033", "formattedPhone"=>"(503) 227-7033"}, "location"=>{"address"=>"400 SW Kingston Ave", "postalCode"=>"97205", "city"=>"Portland", "state"=>"OR", "country"=>"United States", "cc"=>"US"}, "canonicalUrl"=>"https://foursquare.com/v/international-rose-test-garden/4a88a9a2f964a520510720e3"}), :user_id => user10.id)
photo8 = Photo.create(:taken_at => "2013-05-02 09:57:19", :photo_id => "gschool23", :caption => "So purdy", :user_id => user10.id, :url => "http://atowhee.files.wordpress.com/2012/07/july26-portland-002.jpg")
tweet11 = Tweet.create(:tweeted_at => "2013-05-02 9:57:52", :tweet_id => "gschool24", :text => "Where's the best place to get dinner in the alphabet district?", :user_id => user2.id)
checkin6 = CheckIn.create(:checked_in_at => "2013-05-02 09:58:23", :check_in_id => "gschool25", :venue => Hashie::Mash.new({"id"=>"gschool25", "name"=>"Serratto", "contact"=>{"phone"=>"5032211195", "formattedPhone"=>"(503) 221-1195"}, "location"=>{"address"=>"2112 NW Kearney Street", "postalCode"=>"97210", "city"=>"Portland", "state"=>"OR", "country"=>"United States", "cc"=>"US"}, "canonicalUrl"=>"https://foursquare.com/v/serratto/4a4b75c0f964a5205fac1fe3"}), :user_id => user10.id)
photo8 = Photo.create(:taken_at => "2013-05-02 09:58:32", :photo_id => "gschool26", :caption => "the. best. baked mac and cheese", :user_id => user10.id, :url => "http://3.bp.blogspot.com/-vVkpvEf2Ng0/Th3qjBLQhdI/AAAAAAAABcI/-4r2Hk8F5Rs/s1600/baked+mac+n+cheese.jpg")
tweet12 = Tweet.create(:tweeted_at => "2013-05-02 9:58:42", :tweet_id => "gschool27", :text => "Stuffed.  Ready to walk some of this off along the river.", :user_id => user1.id)
tweet13 = Tweet.create(:tweeted_at => "2013-05-02 9:58:52", :tweet_id => "gschool28", :text => "To the surprise of no one, it's raining.  We decided we're going for a walk anyway.", :user_id => user2.id)
photo9 = Photo.create(:taken_at => "2013-05-02 09:59:32", :photo_id => "gschool29", :caption => "goodnight Portland!", :user_id => user10.id, :url => "http://www.sheaivey.com/uploads/photography/portland-night/portland-night-made-in-oregon.jpg")
tweet14 = Tweet.create(:tweeted_at => "2013-05-02 9:59:42", :tweet_id => "gschool30", :text => "I love how no one cares about the rain here.  Like not even busting out any umbrellas.", :user_id => user10.id)







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

trip5 = user1.trips.create(:name => "Jamaica", :destination => "Kingston, Jamaica", :start => "2013-05-10", :end => "2013-05-17")
ut17 = user1.user_trips.create(:trip_id => trip5.id, :trip_role => "traveler")
ut18 = user9.user_trips.create(:trip_id => trip5.id, :trip_role => "kreepr")
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







