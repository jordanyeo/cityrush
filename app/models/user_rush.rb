class UserRush < ActiveRecord::Base
  belongs_to :user
  belongs_to :rush
  
  validates_presence_of :user_id, :rush_id
end
