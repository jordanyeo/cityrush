# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(:name => 'Jordan Admin', :email => 'jordan@jordanyeo.com', :password => 'changeme', :password_confirmation => 'changeme', :admin => 'true')
Event.create(:name => 'Inaugural CityRush', :scheduled_at => '04/09/2016', :description => 'The very first CityRush. Come check it out!')