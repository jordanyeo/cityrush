class LocationCheckin < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  
  validates_presence_of :user_id, :location_id, :lat, :long
  
  scope :for_user, -> (user) { where(:user_id => user)  }
  
  def check_submission
    Geokit::default_units = :kms
    answer = Geokit::Geocoders::GoogleGeocoder.geocode "#{self.location.lat},#{self.location.long}"
    submission = Geokit::Geocoders::GoogleGeocoder.geocode "#{self.lat},#{self.long}"
    guess_distance = answer.distance_to(submission)
    if guess_distance < 0.5
      self.correct = true
      self.user.increment(:points, 10)
    else
      self.user.decrement(:points, 2)
      self.correct = false
      self.distance_from_correct = guess_distance
    end
    self.save
    self.user.save
  end
end
