class Location < ActiveRecord::Base
  belongs_to :rush
  has_one :clue
  has_many :location_checkins
  has_many :users, :through => :location_checkins
  
  validates_presence_of :name, :description, :lat, :long, :rush_id
  scope :by_rush_order, -> {order(:rush_order)}
  scope :for_rush_order, -> (order) { where(:rush_order => order).first  }
end
