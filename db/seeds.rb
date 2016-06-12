# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@u = User.create(:name => 'Jordan Yeo', :email => 'jordan@jordanyeo.com', :password => 'changeme', :password_confirmation => 'changeme', :admin => 'true')
@a = User.create(:name => 'John Smith', :email => 'john@example.com', :password => 'changeme', :password_confirmation => 'changeme')
@r = Rush.create(:name => 'Beta Launch', :scheduled_at => Time.now, :description => 'Instructions on how to get started go here. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
@u.rushes << @r

@l = Location.create(:name => 'The Starting Line', :rush_id => @r.id, :description => "You're about to embark on the first ever City Rush! Check in at the starting location to get your first clue and begin the race! Your time is tracked at each checkpoint as you rush to solve the task. Good luck!", :lat => 53.412128, :long => -113.49777, :rush_order => 1)
@c = Clue.create(:description => "Head to the southern-most table you can find on the ring to get your first destination!", :location_id => @l.id, :lat => 53.410505, :long => -113.498822)

@l = Location.create(:name => 'Mac and Me', :rush_id => @r.id, :description => "The race is early, but if you head north and a little west, you'll find sanctuary down in the valley at this crossing checkpoint. If you see twin brooks, you'll know you are close. Check in on the blue bridge to get your next clue.", :lat => 53.454898, :long => -113.547781, :rush_order => 2)
@c = Clue.create(:description => "Head into the forest (no campfires) and follow the creek. Once you cross the little bridge, check in on the shore of the little lake.", :location_id => @l.id, :lat => 53.452214, :long => -113.547305)

@l = Location.create(:name => 'Head West', :rush_id => @r.id, :description => "This peninsula is one of the most popular spots to spend some quality time with your best friend. Be as quick as a rabbit, and check in on the grassy island you passed when you arrived.", :lat => 53.479871, :long => -113.607446, :rush_order => 3)
@c = Clue.create(:description => "If you check your map, these paths make up a triangle next to a lake. Rush there with your group, and check in on the northern-most tip to get your next destination!", :location_id => @l.id, :lat => 53.484578, :long => -113.618967)

@l = Location.create(:name => 'Muddy Valley', :rush_id => @r.id, :description => "Don't confuse yourself with a Kart as you head down this colourful road to the parking lot. You'll need to head downhill on foot to check-in on this footbridge over water.", :lat => 53.480613, :long => -113.553971, :rush_order => 4)
@c = Clue.create(:description => "Head into the woods to find this next checkpoint, but don't sit down nearby if you get tired! Watch out for prickles on stems and orange seed cases, it's a sign that you're in the right place.", :location_id => @l.id, :lat => 53.47863, :long => -113.554592)

@l = Location.create(:name => 'Plug Your Nose', :rush_id => @r.id, :description => "In a way, these two parks split by a river are exact opposites. One could make you extremely wealthy, while the other is a bit of a dump. You'll be much better off if you park on the Midas side. Check-in halfway across the span.", :lat => 53.555035, :long => -113.398316, :rush_order => 5)
@c = Clue.create(:description => "This checkpoint would be your second-last stop before you finish your round. Watch our for birdies as you check in next to the chains and get your next destination", :location_id => @l.id, :lat => 53.553199, :long => -113.393276)

@l = Location.create(:name => 'Rat Race', :rush_id => @r.id, :description => "Game on! You'll find this park not far from a creek. If you have time, stop and admire your reflection for a second, then check-in a few steps away, right in the middle of the big O.", :lat => 53.562776, :long => -113.458475, :rush_order => 6)
@c = Clue.create(:description => "Stay on foot, head past the water and check in at the closest 'home' you can find, which should be close to a North Star or two.", :location_id => @l.id, :lat => 53.562265, :long => -113.451393)

@l = Location.create(:name => 'Little Checkpoint', :rush_id => @r.id, :description => "You might expect to find Moose or Archie in this neighbourhood. Stop for a break if you need to, but check in near the chimney to get your next destination.", :lat => 53.542112, :long => -113.469467, :rush_order => 7)
@c = Clue.create(:description => "Head west on foot and search for a purple Puff. If it was warm enough you may even get wet as you check in beneath his head.", :location_id => @l.id, :lat => 53.541548, :long => -113.473119)

@l = Location.create(:name => 'Finish Line', :rush_id => @r.id, :description => "You're on the home stretch! Head to one of the biggest white tents you know to check in at the finish line and enjoy a hard earned meal.", :lat => 53.542112, :long => -113.469467, :rush_order => 8)

