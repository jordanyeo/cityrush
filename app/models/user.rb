class User < ActiveRecord::Base
  has_many :user_rushes
  has_many :rushes, :through => :user_rushes
  has_many :location_checkins
  has_many :locations, :through => :location_checkins
  has_many :clue_checkins
  has_many :clues, :through => :clue_checkins

  devise :invitable, :database_authenticatable, :invitable,
         :recoverable, :rememberable, :trackable, :validatable
end
