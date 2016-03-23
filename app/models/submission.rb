class Submission < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  belongs_to :clue
  
  validates_presence_of :latitude, :longitude
  after_create :validate_checkin
  
  private
  
  def validate_checkin
    Geokit::default_units = :kms
    clue_latlong = Geokit::Geocoders::GoogleGeocoder.geocode "#{self.clue.latitude},#{self.clue.longitude}"
    submission_latlong = Geokit::Geocoders::GoogleGeocoder.geocode "#{self.latitude},#{self.longitude}"
    guess_distance = clue_latlong.distance_to(submission_latlong)
    if guess_distance < 0.5
      self.correct = true
      self.user.increment(:points, 10)
    else
      self.user.decrement(:points, 2)
      self.correct = false
      self.distance = guess_distance
    end
    self.save
  end
end
