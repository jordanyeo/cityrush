class LocationCheckin < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  
  validates_presence_of :user_id, :location_id, :lat, :long
end
