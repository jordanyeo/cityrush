class Rush < ActiveRecord::Base
  has_many :user_rushes
  has_many :users, :through => :user_rushes
  has_many :locations
  
  validates_presence_of :name
end
