# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@a = User.create(:name => 'Jordan Yeo', :email => 'jordan@jordanyeo.com', :password => 'changeme', :password_confirmation => 'changeme', :admin => 'true')
@a = User.create(:name => 'John Smith', :email => 'john@example.com', :password => 'changeme', :password_confirmation => 'changeme')
@e = Event.create(:name => 'Inaugural CityRush', :scheduled_at => '04/09/2016 11:00AM', :description => 'The very first CityRush that will take you around #YEG')
@c = Clue.create(:name => 'Fruit and Veg', :event_id => @e.id, :description => 'This site was originally used to grow fruits and vegetables for local consumption. Featuring historic architecture not typical of Canada, and many walking paths, this area has been managed since 2000 by a society of local Edmontonians. Check in with your team while over the water.', :latitude => '53.561043', :longitude => '-113.444232')
