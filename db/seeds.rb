# ACTUAL ACCOUNTS
user1 = User.find_by_username("eebee_1")
user2 = User.find_by_username("sussinct1")
user3 = User.find_by_username("weiner_2013")
user4 = User.find_by_username("phil_er_up3")

# Fake data only; these accounts do not exist
user5 = User.create!(:username => "comic-girl", :avatar => "http://splashpage.mtv.com/wp-content/uploads/2010/03/032410_guild.jpg")
user6 = User.create!(:username => "time-mag", :avatar => "https://si0.twimg.com/profile_images/3656458804/8513bad06d749c883e31b0ce70da2a95.jpeg")
user7 = User.create!(:username => "kale_lvr", :avatar => "http://2.bp.blogspot.com/-caQ42Yk_fIg/TudWOoPS-8I/AAAAAAAACBg/QKuy9y0-iV0/s1600/eat-more-kale-sticker.gif")
user8 = User.create!(:username => "irish-burrito1", :avatar => "http://www.ladecostified.com/wp-content/uploads/2010/03/Ireland_flag-300x200.gif")
user9 = User.create!(:username => "no-off", :avatar => "http://www.luisbelerique.com/folio/works/tony_stark_lb.jpg")
user10 = User.create!(:username => "birder", :avatar => "http://teresamakesthings.files.wordpress.com/2012/03/birdstencil.jpg")
user11 = User.create!(:username => "mexico", :avatar => "http://www.vectors4all.net/preview/cartoon-goat-clip-art.jpg")
user12 = User.create!(:username => "canada", :avatar => "http://openclipart.org/people/StudioFibonacci/lemmling_Cartoon_moose.svg")
user13 = User.create!(:username => "marcy", :avatar => "http://s3.amazonaws.com/c3po_store_engine/images/8/large.png?1365052494")

# Trip 1 - Portland with Erin, Laura, Kyle
trip1 = user1.trips.create!(:name => "Portlandia", :destination => "Portland, Oregon", :start => "2013-05-01", :end => "2013-05-04")
ut1 = user1.user_trips.create!(:trip_id => trip1.id, :trip_role => "traveler")
ut2 = user2.user_trips.create!(:trip_id => trip1.id, :trip_role => "traveler")
ut3 = user10.user_trips.create!(:trip_id => trip1.id, :trip_role => "traveler")
ut4 = user13.user_trips.create!(:trip_id => trip1.id, :trip_role => "kreepr")
ut5 = user7.user_trips.create!(:trip_id => trip1.id, :trip_role => "kreepr")
ut6 = user8.user_trips.create!(:trip_id => trip1.id, :trip_role => "kreepr")
ut7 = user5.user_trips.create!(:trip_id => trip1.id, :trip_role => "kreepr")
ut8 = user12.user_trips.create!(:trip_id => trip1.id, :trip_role => "kreepr")
ut9 = user4.user_trips.create!(:trip_id => trip1.id, :trip_role => "kreepr")

tweet1 = Tweet.create!(:tweeted_at => "2013-05-01 02:52:23", :tweet_id => "gschool1", :text => "Just landed in Portland!  So glad to be back :)", :user_id => user1.id)
tweet2 = Tweet.create!(:tweeted_at => "2013-05-01 03:52:23", :tweet_id => "gschool2", :text => "@eebee_1 @birder meet you at Bridgeport for a drink in an hour?", :user_id => user2.id)
tweet3 = Tweet.create!(:tweeted_at => "2013-05-01 03:54:23", :tweet_id => "gschool3", :text => "@sussinct @birder sounds good!", :user_id => user1.id)
checkin1 = CheckIn.create!(:checked_in_at => "2013-05-01 05:07:23", :check_in_id => "gschool4", :venue => Hashie::Mash.new({"id"=>"gschool4", "name"=>"Bridgeport Brewing Company", "contact"=>{"phone"=>"5032413612", "formattedPhone"=>"(503) 241-3612"}, "location"=>{"address"=>"1313 NW Marshall Street", "postalCode"=>"97209", "city"=>"Portland", "state"=>"OR", "country"=>"United States", "cc"=>"US"}, "canonicalUrl"=>"https://foursquare.com/v/bridgeport-brewery--brewpub/40b13b00f964a52054f51ee3"}), :user_id => user2.id)
photo1 = Photo.create!(:taken_at => "2013-05-01 05:35:23", :photo_id => "gschool5", :caption => "this beer is so good!", :user_id => user10.id, :url => "http://s3-media1.ak.yelpcdn.com/bphoto/xvMqh1cmaS9gXqWd99TCwg/l.jpg")
photo2 = Photo.create!(:taken_at => "2013-05-01 07:45:19", :photo_id => "gschool6", :caption => "haha... keep Portland weird indeed!", :user_id => user1.id, :url => "http://onlyinthiscity.org/wp-content/uploads/2012/05/Darth-Vader-Playing-The-Bagpipes-While-Riding-A-Unicycle.jpg")
checkin2 = CheckIn.create!(:checked_in_at => "2013-05-01 09:38:23", :check_in_id => "gschool7", :venue => Hashie::Mash.new({"id"=>"gschool7", "name"=>"Doug Fir Lounge", "contact"=>{"phone"=>"5032319663", "formattedPhone"=>"(503) 231-9663"}, "location"=>{"address"=>"830 E Burnside St", "postalCode"=>"97214", "city"=>"Portland", "state"=>"OR", "country"=>"United States", "cc"=>"US"}, "canonicalUrl"=>"https://foursquare.com/v/doug-fir-lounge/43ba6040f964a520e62c1fe3"}), :user_id => user2.id, :text => "Hope this band is good.  Haven't heard of them yet.  Birches & Binary?")
tweet4 = Tweet.create!(:tweeted_at => "2013-05-01 11:52:24", :tweet_id => "gschool8", :text => "Well, Birches & Binary is turning out to be pretty good, but man I am beat.", :user_id => user1.id)
photo3 = Photo.create!(:taken_at => "2013-05-01 011:57:19", :photo_id => "gschool9", :caption => "goodnight Portland!", :user_id => user10.id, :url => "http://api.ning.com/files/phxkX8gfqaSDBo1hJX7tKTJu686cNw2Rqz36uFk20ILSahMhF8-G0sr2df6SNzVwKo1NjiCbBCAqaDg4Im9NLQjcarhszoX9/SchnitzerAtNightFrontWMC.jpg")
checkin3 = CheckIn.create!(:checked_in_at => "2013-05-02 09:38:23", :check_in_id => "gschool10", :venue => Hashie::Mash.new({"id"=>"gschool10", "name"=>"Voodoo Doughnut", "contact"=>{"phone"=>"5032414704", "formattedPhone"=>"(503) 241-4704"}, "location"=>{"address"=>"22 SW 3rd Ave", "postalCode"=>"97204", "city"=>"Portland", "state"=>"OR", "country"=>"United States", "cc"=>"US"}, "canonicalUrl"=>"https://foursquare.com/v/voodoo-doughnut/42829c80f964a5201b221fe3"}), :user_id => user1.id, :text => "Yum!!!")
tweet5 = Tweet.create!(:tweeted_at => "2013-05-02 9:42:52", :tweet_id => "gschool11", :text => "Hardest part about eating at @VoodooDoughnut: picking just one.", :user_id => user2.id)
photo4 = Photo.create!(:taken_at => "2013-05-02 09:43:19", :photo_id => "gschool12", :caption => "the line at Voodoo is out of control", :user_id => user10.id, :url => "http://oregonnvc.files.wordpress.com/2010/02/voodoodonut1.jpg")
tweet6 = Tweet.create!(:tweeted_at => "2013-05-02 9:45:52", :tweet_id => "gschool13", :text => "Lovely day for kayaking with @eebee_1 and @birder.  If you're in Portland and feel up to it, join us!", :user_id => user2.id)
tweet7 = Tweet.create!(:tweeted_at => "2013-05-02 9:46:52", :tweet_id => "gschool14", :text => "The eternal dilemma... leave the phone in a locker, or bring it for pictures and risk destroying it.", :user_id => user2.id)
checkin4 = CheckIn.create!(:checked_in_at => "2013-05-02 09:48:23", :check_in_id => "gschool15", :venue => Hashie::Mash.new({"id"=>"gschool15", "name"=>"Alder Creek Kayak and Canoe", "contact"=>{"phone"=>"5032851819", "formattedPhone"=>"(503) 285-1819"}, "location"=>{"address"=>"1515 SE Water Ave", "postalCode"=>"97214", "city"=>"Portland", "state"=>"OR", "country"=>"United States", "cc"=>"US"}, "canonicalUrl"=>"https://foursquare.com/v/alder-creek-kayak--canoe/4b25ca6ef964a520407624e3"}), :user_id => user10.id)
photo5 = Photo.create!(:taken_at => "2013-05-02 09:49:19", :photo_id => "gschool16", :caption => "lovely day :)", :user_id => user1.id, :url => "http://www.discoverportland.net/images/stories/2011_photos/Portland-Kayak-Company.jpg")
photo6 = Photo.create!(:taken_at => "2013-05-02 09:50:19", :photo_id => "gschool17", :caption => "I love this city", :user_id => user2.id, :url => "http://www.portlandkayak.com/prcwebpics/Ross%20Island%20Gallery/024_2A.JPG")
photo7 = Photo.create!(:taken_at => "2013-05-02 09:51:19", :photo_id => "gschool18", :caption => "Decided to stop by the OMSI to check out the submarine.  Erin doesn't like it.", :user_id => user10.id, :url => "http://media.tumblr.com/tumblr_ls3k4e2NYt1r0fv3u.jpg")
tweet8 = Tweet.create!(:tweeted_at => "2013-05-02 9:52:52", :tweet_id => "gschool19", :text => "Well... I guess a career in the Navy is out.  Those subs are way too claustrophobic!", :user_id => user1.id)
tweet9 = Tweet.create!(:tweeted_at => "2013-05-02 9:54:52", :tweet_id => "gschool20", :text => "Off to check out the rose test garden.  Bet there will be some awesome birds there!", :user_id => user10.id)
tweet10 = Tweet.create!(:tweeted_at => "2013-05-02 9:55:52", :tweet_id => "gschool21", :text => "I just need to point out there is a variety of rose here named David Bowie.", :user_id => user1.id)
checkin5 = CheckIn.create!(:checked_in_at => "2013-05-02 09:56:23", :check_in_id => "gschool22", :venue => Hashie::Mash.new({"id"=>"gschool22", "name"=>"International Rose Test Garden", "contact"=>{"phone"=>"5032277033", "formattedPhone"=>"(503) 227-7033"}, "location"=>{"address"=>"400 SW Kingston Ave", "postalCode"=>"97205", "city"=>"Portland", "state"=>"OR", "country"=>"United States", "cc"=>"US"}, "canonicalUrl"=>"https://foursquare.com/v/international-rose-test-garden/4a88a9a2f964a520510720e3"}), :user_id => user10.id)
photo8 = Photo.create!(:taken_at => "2013-05-02 09:57:19", :photo_id => "gschool23", :caption => "So purdy", :user_id => user10.id, :url => "http://atowhee.files.wordpress.com/2012/07/july26-portland-002.jpg")
tweet11 = Tweet.create!(:tweeted_at => "2013-05-02 9:57:52", :tweet_id => "gschool24", :text => "Where's the best place to get dinner in the alphabet district?", :user_id => user2.id)
checkin6 = CheckIn.create!(:checked_in_at => "2013-05-02 09:58:23", :check_in_id => "gschool25", :venue => Hashie::Mash.new({"id"=>"gschool25", "name"=>"Serratto", "contact"=>{"phone"=>"5032211195", "formattedPhone"=>"(503) 221-1195"}, "location"=>{"address"=>"2112 NW Kearney Street", "postalCode"=>"97210", "city"=>"Portland", "state"=>"OR", "country"=>"United States", "cc"=>"US"}, "canonicalUrl"=>"https://foursquare.com/v/serratto/4a4b75c0f964a5205fac1fe3"}), :user_id => user10.id)
photo8 = Photo.create!(:taken_at => "2013-05-02 09:58:32", :photo_id => "gschool26", :caption => "the. best. baked mac and cheese", :user_id => user10.id, :url => "http://3.bp.blogspot.com/-vVkpvEf2Ng0/Th3qjBLQhdI/AAAAAAAABcI/-4r2Hk8F5Rs/s1600/baked+mac+n+cheese.jpg")
tweet12 = Tweet.create!(:tweeted_at => "2013-05-02 9:58:42", :tweet_id => "gschool27", :text => "Stuffed.  Ready to walk some of this off along the river.", :user_id => user1.id)
tweet13 = Tweet.create!(:tweeted_at => "2013-05-02 9:58:52", :tweet_id => "gschool28", :text => "To the surprise of no one, it's raining.  We decided we're going for a walk anyway.", :user_id => user2.id)
photo9 = Photo.create!(:taken_at => "2013-05-02 09:59:32", :photo_id => "gschool29", :caption => "goodnight Portland!", :user_id => user10.id, :url => "http://www.sheaivey.com/uploads/photography/portland-night/portland-night-made-in-oregon.jpg")
tweet14 = Tweet.create!(:tweeted_at => "2013-05-02 9:59:42", :tweet_id => "gschool30", :text => "I love how no one cares about the rain here.  Like not even busting out any umbrellas.", :user_id => user10.id)
tweet15 = Tweet.create!(:tweeted_at => "2013-05-03 02:01:42", :tweet_id => "gschool31", :text => "I want to take these food trucks back home - enjoying a breakfast burrito with @eebee_1 & @sussinct ", :user_id => user10.id)
tweet16 = Tweet.create!(:tweeted_at => "2013-05-03 02:02:42", :tweet_id => "gschool32", :text => "@birder - seriously.  The food trucks here are awesome", :user_id => user1.id)
tweet17 = Tweet.create!(:tweeted_at => "2013-05-03 02:03:42", :tweet_id => "gschool33", :text => "@birder @eebee_1 well... except for that weird guy with the four foot tophat selling moldy waffles", :user_id => user2.id)
checkin7 = CheckIn.create!(:checked_in_at => "2013-05-03 03:58:23", :check_in_id => "gschool34", :venue => Hashie::Mash.new({"id"=>"gschool34", "name"=>"Lan Su Chinese Gardens", "contact"=>{"phone"=>"5032288131", "formattedPhone"=>"(503) 228-8131"}, "location"=>{"address"=>"239 NW Everett St", "postalCode"=>"97209", "city"=>"Portland", "state"=>"OR", "country"=>"United States", "cc"=>"US"}, "canonicalUrl"=>"https://foursquare.com/v/lan-su-chinese-garden/4a663a60f964a5203bc81fe3"}), :user_id => user2.id)
tweet18 = Tweet.create!(:tweeted_at => "2013-05-03 03:59:42", :tweet_id => "gschool35", :text => "uhhh... pretty sure that was Michael Ian Black we just walked past", :user_id => user1.id)
photo10 = Photo.create!(:taken_at => "2013-05-03 04:09:32", :photo_id => "gschool36", :caption => "Lan Su", :user_id => user10.id, :url => "http://media.tumblr.com/tumblr_ls3ix34ezI1r0fv3u.jpg")
photo11 = Photo.create!(:taken_at => "2013-05-03 04:19:32", :photo_id => "gschool37", :caption => "cute little tea house", :user_id => user1.id, :url => "http://1.bp.blogspot.com/_MxyuQhbqX60/TS_sLQ0y1fI/AAAAAAAACGk/bR9jpnhVWE8/s1600/IMG_2623.JPG")
tweet19 = Tweet.create!(:tweeted_at => "2013-05-03 04:24:42", :tweet_id => "gschool38", :text => "anyone know what's going on in Pioneer Courthouse Square?  Tons of people here", :user_id => user1.id)
tweet20 = Tweet.create!(:tweeted_at => "2013-05-03 04:25:42", :tweet_id => "gschool39", :text => "no idea what's going on, but good people watching", :user_id => user1.id)
photo12 = Photo.create!(:taken_at => "2013-05-03 04:26:32", :photo_id => "gschool40", :user_id => user1.id, :url => "http://media.oregonlive.com/oregonian/photo/2013/03/12504022-essay.jpg")
tweet21 = Tweet.create!(:tweeted_at => "2013-05-03 04:27:42", :tweet_id => "gschool41", :text => "think we'll just spend this afternoon people watching", :user_id => user2.id)
photo13 = Photo.create!(:taken_at => "2013-05-03 04:29:32", :photo_id => "gschool42", :user_id => user2.id, :url => "http://itorganization2017.files.wordpress.com/2010/09/p10401161.jpg")
photo14 = Photo.create!(:taken_at => "2013-05-03 04:32:32", :photo_id => "gschool43", :caption => "love the view of the mountain", :user_id => user10.id, :url => "http://images.fanpop.com/images/image_uploads/Portland-and-Mt--Hood-portland-696661_550_427.jpg")
checkin8 = CheckIn.create!(:checked_in_at => "2013-05-03 04:38:23", :check_in_id => "gschool44", :venue => Hashie::Mash.new({"id"=>"gschool44", "name"=>"Toro Bravo", "contact"=>{"phone"=>"5032814464", "formattedPhone"=>"(503) 281-4464"}, "location"=>{"address"=>"120 NE Russell St", "postalCode"=>"97212", "city"=>"Portland", "state"=>"OR", "country"=>"United States", "cc"=>"US"}, "canonicalUrl"=>"https://foursquare.com/torobravopdx"}), :user_id => user2.id)
tweet21 = Tweet.create!(:tweeted_at => "2013-05-03 04:40:42", :tweet_id => "gschool45", :text => "thanks for recommending Toro Bravo @stumptowner!  So delicious!", :user_id => user10.id)
tweet22 = Tweet.create!(:tweeted_at => "2013-05-03 04:42:42", :tweet_id => "gschool46", :text => "@stumptowner we're splitting the paella", :user_id => user10.id)
photo15 = Photo.create!(:taken_at => "2013-05-03 04:44:32", :photo_id => "gschool47", :caption => "best paella EVAR", :user_id => user2.id, :url => "http://www.chicagomag.com/galleries/1042/25748-corrToro-Bravo.Paella.jpg")
tweet23 = Tweet.create!(:tweeted_at => "2013-05-03 04:46:42", :tweet_id => "gschool48", :text => "cannot believe it's almost over, but thanks @birder @sussinct for an awesome trip!", :user_id => user1.id)
tweet24 = Tweet.create!(:tweeted_at => "2013-05-03 04:47:42", :tweet_id => "gschool49", :text => "@eebee_1 - I know!  I don't want to go home!", :user_id => user10.id)
checkin9 = CheckIn.create!(:checked_in_at => "2013-05-03 04:48:23", :check_in_id => "gschool50", :venue => Hashie::Mash.new({"id"=>"gschool50", "name"=>"APEX", "contact"=>{"phone"=>"5032739227", "formattedPhone"=>"(503) 273-9227"}, "location"=>{"address"=>"1216 SE Division St", "postalCode"=>"97202", "city"=>"Portland", "state"=>"OR", "country"=>"United States", "cc"=>"US"}, "canonicalUrl"=>"https://foursquare.com/v/apex/4bd11653462cb713dfcbd907"}), :user_id => user2.id)
photo16 = Photo.create!(:taken_at => "2013-05-03 04:49:32", :photo_id => "gschool51", :caption => "not thinking about the trip back tomorrow", :user_id => user1.id, :url => "http://2.bp.blogspot.com/-CCVS-J2lgbY/T7ajFt0Mx6I/AAAAAAAAJ1w/94tXzyqyWF4/s1600/DSCN0587.JPG")
photo17 = Photo.create!(:taken_at => "2013-05-03 04:50:32", :photo_id => "gschool52", :caption => "I give you one last classic Portland siting", :user_id => user2.id, :url => "http://farm5.staticflickr.com/4077/4869949502_e14db79156_z.jpg")
tweet25 = Tweet.create!(:tweeted_at => "2013-05-03 04:51:42", :tweet_id => "gschool53", :text => "bye for now Stumptown!", :user_id => user10.id)



#Trip 2 - Vegas with Raph, Phil, Shane, and Blair
trip2 = user3.trips.create!(:name => "Vegas Baby!", :destination => "Las Vegas, Nevada", :start => "2013-05-04", :end => "2013-05-10")
ut10 = user3.user_trips.create!(:trip_id => trip2.id, :trip_role => "traveler")
ut11 = user4.user_trips.create!(:trip_id => trip2.id, :trip_role => "traveler")
ut12 = user8.user_trips.create!(:trip_id => trip2.id, :trip_role => "traveler")
ut13 = user7.user_trips.create!(:trip_id => trip2.id, :trip_role => "traveler")
ut14 = user11.user_trips.create!(:trip_id => trip2.id, :trip_role => "kreepr")
ut15 = user9.user_trips.create!(:trip_id => trip2.id, :trip_role => "kreepr")
ut16 = user2.user_trips.create!(:trip_id => trip2.id, :trip_role => "kreepr")
ut17 = user1.user_trips.create!(:trip_id => trip2.id, :trip_role => "kreepr")
ut18 = user6.user_trips.create!(:trip_id => trip2.id, :trip_role => "kreepr")

tweet26 = Tweet.create!(:tweeted_at => "2013-05-04 02:52:23", :tweet_id => "gschool54", :text => "Ready to hit the slots!", :user_id => user3.id)
tweet27 = Tweet.create!(:tweeted_at => "2013-05-04 03:52:23", :tweet_id => "gschool55", :text => "@weiner_2013 and the slots are ready to hit your wallet", :user_id => user8.id)
tweet28 = Tweet.create!(:tweeted_at => "2013-05-04 03:54:23", :tweet_id => "gschool56", :text => "@weiner_2013 @kale_lvr @irish_burrito1 just landed!  See you guys in a bit.", :user_id => user4.id)
checkin10 = CheckIn.create!(:checked_in_at => "2013-05-04 05:07:23", :check_in_id => "gschool57", :venue => Hashie::Mash.new({"id"=>"gschool57", "name"=>"Caesar's Palace Casino", "contact"=>{"phone"=>"8662275938", "formattedPhone"=>"(866) 227-5938"}, "location"=>{"address"=>"3570 Las Vegas Blvd S", "postalCode"=>"89109", "city"=>"Las Vegas", "state"=>"NV", "country"=>"United States", "cc"=>"US"}, "canonicalUrl"=>"https://foursquare.com/v/caesars-palace-hotel--casino/41326e00f964a520da131fe3"}), :user_id => user3.id)
photo1 = Photo.create!(:taken_at => "2013-05-04 05:35:23", :photo_id => "gschool58", :caption => "slots slots slots slots", :user_id => user7.id, :url => "http://upload.wikimedia.org/wikipedia/en/8/82/Las_Vegas_slot_machines.jpg")
photo2 = Photo.create!(:taken_at => "2013-05-04 07:45:19", :photo_id => "gschool59", :caption => "wish me luck!", :user_id => user8.id, :url => "http://aussiecasinoonline.net.au/wp-content/uploads/2013/03/online-casino.jpg")
checkin11 = CheckIn.create!(:checked_in_at => "2013-05-05 09:38:23", :check_in_id => "gschool60", :venue => Hashie::Mash.new({"id"=>"gschool60", "name"=>"Bellagio Hotel and Casino", "contact"=>{"phone"=>"7026937111", "formattedPhone"=>"(702) 693-7111"}, "location"=>{"address"=>"3600 Las Vegas Blvd S", "postalCode"=>"89109", "city"=>"Las Vegas", "state"=>"NV", "country"=>"United States", "cc"=>"US"}, "canonicalUrl"=>"https://foursquare.com/v/bellagio-hotel--casino/41326e00f964a520c0131fe3"}), :user_id => user8.id, :text => "Better luck here?")
tweet29 = Tweet.create!(:tweeted_at => "2013-05-05 11:52:24", :tweet_id => "gschool61", :text => "I won!!!!!!  $10,000, baby!", :user_id => user4.id)
tweet30 = Tweet.create!(:tweeted_at => "2013-05-05 11:52:52", :tweet_id => "gschool62", :text => "And nevermind.  @weiner_2013 just informed me my winnings were in pennies.", :user_id => user4.id)
photo3 = Photo.create!(:taken_at => "2013-05-05 11:57:19", :photo_id => "gschool63", :caption => "Don't mind if I do", :user_id => user8.id, :url => "http://0.tqn.com/d/govegas/1/0/4/-/2/bellpool4.JPG")
checkin12 = CheckIn.create!(:checked_in_at => "2013-05-05 12:38:23", :check_in_id => "gschool64", :venue => Hashie::Mash.new({"id"=>"gschool64", "name"=>"The Pool at Bellagio", "contact"=>{"phone"=>"7026937111", "formattedPhone"=>"(702) 693-7111"}, "location"=>{"address"=>"3600 Las Vegas Blvd S", "postalCode"=>"89109", "city"=>"Las Vegas", "state"=>"NV", "country"=>"United States", "cc"=>"US"}, "canonicalUrl"=>"https://foursquare.com/v/the-pool-at-bellagio/4aa4177bf964a5203e4520e3"}), :user_id => user3.id)
photo4 = Photo.create!(:taken_at => "2013-05-05 12:43:19", :photo_id => "gschool65", :caption => "this place is unreal", :user_id => user7.id, :url => "http://lifescapesintl.com/libraries/images/portfolio/las-vegas-strip/vegas-7.jpg")
tweet31 = Tweet.create!(:tweeted_at => "2013-05-05 12:45:52", :tweet_id => "gschool66", :text => "THE BUFFET HAS ALL YOU CAN EAT KALE!  Is anyone as excited as I am?!", :user_id => user8.id)
tweet32 = Tweet.create!(:tweeted_at => "2013-05-05 12:46:52", :tweet_id => "gschool67", :text => "@kale_lvr who cares?  It has all you can eat burritos!", :user_id => user7.id)
checkin13 = CheckIn.create!(:checked_in_at => "2013-05-06 09:48:23", :check_in_id => "gschool68", :venue => Hashie::Mash.new({"id"=>"gschool68", "name"=>"The Egg and I", "contact"=>{"phone"=>"7023649686", "formattedPhone"=>"(702) 364-9686"}, "location"=>{"address"=>"4533 W Sahara Ave", "postalCode"=>"89102", "city"=>"Las Vegas", "state"=>"NV", "country"=>"United States", "cc"=>"US"}, "canonicalUrl"=>"https://foursquare.com/v/egg--i/4a96e2c6f964a520622720e3"}), :user_id => user4.id)
photo5 = Photo.create!(:taken_at => "2013-05-06 09:49:19", :photo_id => "gschool69", :caption => "I am starting to feel American", :user_id => user7.id, :url => "http://upload.wikimedia.org/wikipedia/commons/1/16/Las_Vegas_NY_NY_Hotel.jpg")
photo6 = Photo.create!(:taken_at => "2013-05-06 09:50:19", :photo_id => "gschool70", :caption => "I love this city", :user_id => user3.id, :url => "http://www.vegasnews.com/wp-content/uploads/Perez-girls-9-588.jpg")
photo7 = Photo.create!(:taken_at => "2013-05-06 09:51:19", :photo_id => "gschool71", :caption => "Never too early to get started in Vegas", :user_id => user3.id, :url => "http://www.ncbshow.com/files/ncbshow/nodes/2010/24/106.jpg")
tweet33 = Tweet.create!(:tweeted_at => "2013-05-06 9:52:52", :tweet_id => "gschool72", :text => "$1000 for bottle service?  I can build an arduino robot to bring me a bottle for $20.", :user_id => user8.id)
tweet34 = Tweet.create!(:tweeted_at => "2013-05-06 9:54:52", :tweet_id => "gschool73", :text => "@kale_lvr well you fiddle with robots, and we'll the fort down here for you", :user_id => user4.id)
tweet35 = Tweet.create!(:tweeted_at => "2013-05-06 9:55:52", :tweet_id => "gschool74", :text => "I thought I saw Snooki, but then realized everyone looks like Snooki here.", :user_id => user7.id)
checkin14 = CheckIn.create!(:checked_in_at => "2013-05-07 09:56:23", :check_in_id => "gschool75", :venue => Hashie::Mash.new({"id"=>"gschool75", "name"=>"Venetian Resort and Casino", "contact"=>{"phone"=>"7024141000", "formattedPhone"=>"(702) 414-1000"}, "location"=>{"address"=>"3355 South Las Vegas Blvd", "postalCode"=>"89109", "city"=>"Las Vegas", "state"=>"NV", "country"=>"United States", "cc"=>"US"}, "canonicalUrl"=>"https://foursquare.com/v/venetian-resort--casino/41326e00f964a52038151fe3"}), :user_id => user4.id)
photo8 = Photo.create!(:taken_at => "2013-05-07 09:57:19", :photo_id => "gschool76", :caption => "Not tacky at all", :user_id => user8.id, :url => "http://www.thelifeofluxury.com/images/venetian_resort_hotel_gondola.jpg")
tweet36 = Tweet.create!(:tweeted_at => "2013-05-07 9:57:52", :tweet_id => "gschool77", :text => "Not having good luck.  Total winnings: $1700.  But my net is -$1500 :(?", :user_id => user3.id)
checkin15 = CheckIn.create!(:checked_in_at => "2013-05-07 09:58:23", :check_in_id => "gschool78", :venue => Hashie::Mash.new({"id"=>"gschool78", "name"=>"Penn & Teller Theatre", "contact"=>{"phone"=>"8667467671", "formattedPhone"=>"(866) 746-7671"}, "location"=>{"address"=>"3700 W Flamingo Road", "postalCode"=>"89103", "city"=>"Las Vegas", "state"=>"NV", "country"=>"United States", "cc"=>"US"}, "canonicalUrl"=>"https://foursquare.com/v/penn--teller-theater/4a76586df964a520e1e21fe3"}), :user_id => user4.id)
tweet37 = Tweet.create!(:tweeted_at => "2013-05-07 9:58:42", :tweet_id => "gschool79", :text => "Penn & Teller were excellent.  Although so sorry it wasn't Celine Dion like you wanted, @weiner_2013", :user_id => user7.id)
photo8 = Photo.create!(:taken_at => "2013-05-07 09:58:32", :photo_id => "gschool80", :caption => "pool party!!!", :user_id => user3.id, :url => "http://www.ihookupvegas.com/wp-content/uploads/2010/10/tao-beach-las-vegas-pool-party.jpg")



# photo9 = Photo.create!(:taken_at => "2013-05-07 09:59:32", :photo_id => "gschool82", :caption => "goodnight Portland!", :user_id => user10.id, :url => "http://www.sheaivey.com/uploads/photography/portland-night/portland-night-made-in-oregon.jpg")
# tweet39 = Tweet.create!(:tweeted_at => "2013-05-07 9:59:42", :tweet_id => "gschool83", :text => "I love how no one cares about the rain here.  Like not even busting out any umbrellas.", :user_id => user10.id)
# tweet40 = Tweet.create!(:tweeted_at => "2013-05-03 02:01:42", :tweet_id => "gschool84", :text => "I want to take these food trucks back home - enjoying a breakfast burrito with @eebee_1 & @sussinct ", :user_id => user10.id)
# tweet41 = Tweet.create!(:tweeted_at => "2013-05-03 02:02:42", :tweet_id => "gschool85", :text => "@birder - seriously.  The food trucks here are awesome", :user_id => user1.id)
# tweet42 = Tweet.create!(:tweeted_at => "2013-05-03 02:03:42", :tweet_id => "gschool86", :text => "@birder @eebee_1 well... except for that weird guy with the four foot tophat selling moldy waffles", :user_id => user2.id)
# checkin16 = CheckIn.create!(:checked_in_at => "2013-05-03 03:58:23", :check_in_id => "gschool87", :venue => Hashie::Mash.new({"id"=>"gschool34", "name"=>"Lan Su Chinese Gardens", "contact"=>{"phone"=>"5032288131", "formattedPhone"=>"(503) 228-8131"}, "location"=>{"address"=>"239 NW Everett St", "postalCode"=>"97209", "city"=>"Portland", "state"=>"OR", "country"=>"United States", "cc"=>"US"}, "canonicalUrl"=>"https://foursquare.com/v/lan-su-chinese-garden/4a663a60f964a5203bc81fe3"}), :user_id => user2.id)
# tweet43 = Tweet.create!(:tweeted_at => "2013-05-03 03:59:42", :tweet_id => "gschool88", :text => "uhhh... pretty sure that was Michael Ian Black we just walked past", :user_id => user1.id)
# photo10 = Photo.create!(:taken_at => "2013-05-03 04:09:32", :photo_id => "gschool89", :caption => "Lan Su", :user_id => user10.id, :url => "http://media.tumblr.com/tumblr_ls3ix34ezI1r0fv3u.jpg")
# photo11 = Photo.create!(:taken_at => "2013-05-03 04:19:32", :photo_id => "gschool90", :caption => "cute little tea house", :user_id => user1.id, :url => "http://1.bp.blogspot.com/_MxyuQhbqX60/TS_sLQ0y1fI/AAAAAAAACGk/bR9jpnhVWE8/s1600/IMG_2623.JPG")
# tweet44 = Tweet.create!(:tweeted_at => "2013-05-03 04:24:42", :tweet_id => "gschool91", :text => "anyone know what's going on in Pioneer Courthouse Square?  Tons of people here", :user_id => user1.id)
# tweet45 = Tweet.create!(:tweeted_at => "2013-05-03 04:25:42", :tweet_id => "gschool92", :text => "no idea what's going on, but good people watching", :user_id => user1.id)
# photo12 = Photo.create!(:taken_at => "2013-05-03 04:26:32", :photo_id => "gschool93", :user_id => user1.id, :url => "http://media.oregonlive.com/oregonian/photo/2013/03/12504022-essay.jpg")
# tweet46 = Tweet.create!(:tweeted_at => "2013-05-03 04:27:42", :tweet_id => "gschool94", :text => "think we'll just spend this afternoon people watching", :user_id => user2.id)
# photo13 = Photo.create!(:taken_at => "2013-05-03 04:29:32", :photo_id => "gschool95", :user_id => user2.id, :url => "http://itorganization2017.files.wordpress.com/2010/09/p10401161.jpg")
# photo14 = Photo.create!(:taken_at => "2013-05-03 04:32:32", :photo_id => "gschool96", :caption => "love the view of the mountain", :user_id => user10.id, :url => "http://images.fanpop.com/images/image_uploads/Portland-and-Mt--Hood-portland-696661_550_427.jpg")
# checkin17 = CheckIn.create!(:checked_in_at => "2013-05-03 04:38:23", :check_in_id => "gschool97", :venue => Hashie::Mash.new({"id"=>"gschool44", "name"=>"Toro Bravo", "contact"=>{"phone"=>"5032814464", "formattedPhone"=>"(503) 281-4464"}, "location"=>{"address"=>"120 NE Russell St", "postalCode"=>"97212", "city"=>"Portland", "state"=>"OR", "country"=>"United States", "cc"=>"US"}, "canonicalUrl"=>"https://foursquare.com/torobravopdx"}), :user_id => user2.id)
# tweet47 = Tweet.create!(:tweeted_at => "2013-05-03 04:40:42", :tweet_id => "gschool98", :text => "thanks for recommending Toro Bravo @stumptowner!  So delicious!", :user_id => user10.id)
# tweet48 = Tweet.create!(:tweeted_at => "2013-05-03 04:42:42", :tweet_id => "gschool99", :text => "@stumptowner we're splitting the paella", :user_id => user10.id)
# photo15 = Photo.create!(:taken_at => "2013-05-03 04:44:32", :photo_id => "gschool100", :caption => "best paella EVAR", :user_id => user2.id, :url => "http://www.chicagomag.com/galleries/1042/25748-corrToro-Bravo.Paella.jpg")
# tweet49 = Tweet.create!(:tweeted_at => "2013-05-03 04:46:42", :tweet_id => "gschool101", :text => "cannot believe it's almost over, but thanks @birder @sussinct for an awesome trip!", :user_id => user1.id)
# tweet50 = Tweet.create!(:tweeted_at => "2013-05-03 04:47:42", :tweet_id => "gschool102", :text => "@eebee_1 - I know!  I don't want to go home!", :user_id => user10.id)
# checkin18 = CheckIn.create!(:checked_in_at => "2013-05-03 04:48:23", :check_in_id => "gschool103", :venue => Hashie::Mash.new({"id"=>"gschool50", "name"=>"APEX", "contact"=>{"phone"=>"5032739227", "formattedPhone"=>"(503) 273-9227"}, "location"=>{"address"=>"1216 SE Division St", "postalCode"=>"97202", "city"=>"Portland", "state"=>"OR", "country"=>"United States", "cc"=>"US"}, "canonicalUrl"=>"https://foursquare.com/v/apex/4bd11653462cb713dfcbd907"}), :user_id => user2.id)
# photo16 = Photo.create!(:taken_at => "2013-05-03 04:49:32", :photo_id => "gschool104", :caption => "not thinking about the trip back tomorrow", :user_id => user1.id, :url => "http://2.bp.blogspot.com/-CCVS-J2lgbY/T7ajFt0Mx6I/AAAAAAAAJ1w/94tXzyqyWF4/s1600/DSCN0587.JPG")
# photo17 = Photo.create!(:taken_at => "2013-05-03 04:50:32", :photo_id => "gschool105", :caption => "I give you one last classic Portland siting", :user_id => user2.id, :url => "http://farm5.staticflickr.com/4077/4869949502_e14db79156_z.jpg")
# tweet51 = Tweet.create!(:tweeted_at => "2013-05-03 04:51:42", :tweet_id => "gschool106", :text => "bye for now Stumptown!", :user_id => user10.id)



# Trip3 - Canada with Jen and Jorge
trip3 = user12.trips.create!(:name => "Oh Canada", :destination => "Saskatoon", :start => "2013-05-07", :end => "2013-05-14")
ut19 = user12.user_trips.create!(:trip_id => trip3.id, :trip_role => "traveler")
ut20 = user11.user_trips.create!(:trip_id => trip3.id, :trip_role => "traveler")
ut21 = user1.user_trips.create!(:trip_id => trip3.id, :trip_role => "kreepr")


#Trip4 - Birding with Laura and Aimee
trip4 = user10.trips.create!(:name => "Put a bird on it!", :destination => "Estes Park, Colorado", :start => "2013-05-08", :end => "2013-05-10")
ut15 = user5.user_trips.create!(:trip_id => trip4.id, :trip_role => "traveler")
ut16 = user3.user_trips.create!(:trip_id => trip4.id, :trip_role => "kreepr")


#Trip 5 - Jamaica with Erin
trip5 = user1.trips.create!(:name => "Jamaica", :destination => "Kingston, Jamaica", :start => "2013-05-10", :end => "2013-05-17")
ut17 = user1.user_trips.create!(:trip_id => trip5.id, :trip_role => "traveler")
ut18 = user9.user_trips.create!(:trip_id => trip5.id, :trip_role => "kreepr")
ut19 = user8.user_trips.create!(:trip_id => trip5.id, :trip_role => "kreepr")
ut20 = user2.user_trips.create!(:trip_id => trip5.id, :trip_role => "kreepr")
ut21 = user4.user_trips.create!(:trip_id => trip5.id, :trip_role => "kreepr")
ut22 = user10.user_trips.create!(:trip_id => trip5.id, :trip_role => "kreepr")


#Trip 6 - Denver with Kyle, Phil, Raph, and Erin
trip6 = user2.trips.create!(:name => "Summer Vacation", :destination => "San Francisco", :start => "2013-05-18", :end => "2013-05-25")
trip6.visible = true
trip6.save
ut23 = user2.user_trips.create!(:trip_id => trip6.id, :trip_role => "traveler")
ut24 = user4.user_trips.create!(:trip_id => trip6.id, :trip_role => "traveler")
ut25 = user3.user_trips.create!(:trip_id => trip6.id, :trip_role => "traveler")
ut26 = user1.user_trips.create!(:trip_id => trip6.id, :trip_role => "traveler")


#Trip 7 - Chile with Erin


#Trip 8 - Leelanau with Erin




