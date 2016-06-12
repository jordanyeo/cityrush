class ClueCheckin < ActiveRecord::Base
  belongs_to :user
  belongs_to :clue
  
  validates_presence_of :user_id, :clue_id, :lat, :long
  
  scope :for_user, -> (user) { where(:user_id => user)  }
  
  def check_submission
    Geokit::default_units = :kms
    answer = Geokit::Geocoders::GoogleGeocoder.geocode "#{self.clue.lat},#{self.clue.long}"
    submission = Geokit::Geocoders::GoogleGeocoder.geocode "#{self.lat},#{self.long}"
    guess_distance = answer.distance_to(submission)
    if guess_distance < 0.05
      self.correct = true
      self.user.increment(:points, 10)
      rush_locations = self.clue.location.rush.locations.by_rush_order.pluck(:id) #get array of all location ids for a rush, in rush order
      rush_locations.each_cons(2) do |element, next_element| #iterate through pairs of ids in the array
        if element == self.clue.location.id #if the current item in array is our location
          @user_rush = self.clue.location.rush.user_rush(self.user)
          @user_rush.active_location = next_element #set the active location to be the next id in the array
          @user_rush.save!
        end
      end
    else
      self.user.decrement(:points, 2)
      self.correct = false
      self.distance_from_correct = guess_distance
    end
    self.save
    self.user.save
  end
end
