# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@a = User.create(:name => 'Jordan Admin', :email => 'jordan@jordanyeo.com', :password => 'changeme', :password_confirmation => 'changeme', :admin => 'true')
@a = User.create(:name => 'John Smith', :email => 'john@example.com', :password => 'changeme', :password_confirmation => 'changeme')
@e = Event.create(:name => 'Inaugural CityRush', :scheduled_at => '04/09/2016', :description => 'The very first CityRush. Come check it out!')
@c = Clue.create(:name => 'The Pioneers', :event_id => @e.id, :description => 'The answer to this clue is hidden in the greatest pioneers park. Count the outhouses within spitting distance', :answer => '99')
@c = Clue.create(:name => 'Hockey Town', :event_id => @e.id, :description => 'Blah blah blah blah blah blah blah.', :answer => '99')
@c = Clue.create(:name => 'Yeg Yeg Yeg', :event_id => @e.id, :description => 'Blah blah blah blah blah blah blah.', :answer => '99')
@c = Clue.create(:name => 'Coffee', :event_id => @e.id, :description => 'Blah blah blah blah blah blah blah.', :answer => '99')