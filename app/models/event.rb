class Event < ActiveRecord::Base
  has_many :clues
  has_many :submissions
  scope :upcoming, -> {where('events.scheduled_at > ?', Date.today)}
end
