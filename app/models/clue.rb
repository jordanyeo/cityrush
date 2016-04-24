class Clue < ActiveRecord::Base
  belongs_to :location
  has_many :clue_checkins
  has_many :users, :through => :clue_checkins
  validates_presence_of :description, :lat, :long, :location_id
end
