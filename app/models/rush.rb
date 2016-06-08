class Rush < ActiveRecord::Base
  has_many :user_rushes
  has_many :users, :through => :user_rushes
  has_many :locations
  
  validates_presence_of :name
  
  def user_rush(user)
    UserRush.where(:rush_id => self.id, :user_id => user.id).first
  end
  
  def next_location(user)
    @u = UserRush.where(:rush_id => self.id, :user_id => user.id).first
    self.locations.for_rush_order(@u.active_location)
  end
end
