# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@u = User.create(:name => 'Jordan Yeo', :email => 'jordan@jordanyeo.com', :password => 'changeme', :password_confirmation => 'changeme', :admin => 'true')
@a = User.create(:name => 'John Smith', :email => 'john@example.com', :password => 'changeme', :password_confirmation => 'changeme')
@r = Rush.create(:name => 'CityRush Beta Launch', :scheduled_at => Time.now, :description => 'Instructions on how to get started go here. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
@u.rushes << @r
@l = Location.create(:name => 'The Starting Line', :rush_id => @r.id, :description => "Welcome to the first ever City Rush! Blah blah blah.... As soon as you check in at this location, you'll see a clue. Race to that clue, and click Check in to log your location", :lat => 53.412128, :long => -113.49777)
@c = Clue.create(:description => "Head to the southern-most table you can find on the ring to get your first destination!", :location_id => @l.id, :lat => 53.410505, :long => -113.498822)

@l = Location.create(:name => 'Big Red', :rush_id => @r.id, :description => "You can find a little bit of Stockholm in Edmonton nearby this next checkpoint. The way here once had an ARC to it, winding between two man made lakes. Check in at the front fountain, where the circle's inside the square.", :lat => 53.443666, :long => -113.475876)
@c = Clue.create(:description => "Head to the southern-most table you can find on the ring to get your first destination!", :location_id => @l.id, :lat => 53.410505, :long => -113.498822)

@l = Location.create(:name => 'Head West', :rush_id => @r.id, :description => "This peninsula is one of the most popular spots to spend some quality time with your best friend. Be as quick as a rabbit, and check in on the grassy island after you park.", :lat => 53.479871, :long => -113.607446)
@c = Clue.create(:description => "If you check your map, these paths make up a triangle next to a lake. Rush there with your group, and check in on the northern-most tip to get your next destination!", :location_id => @l.id, :lat => 53.410505, :long => -113.498822)


