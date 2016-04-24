class ClueCheckin < ActiveRecord::Base
  belongs_to :user
  belongs_to :clue
  
  validates_presence_of :user_id, :clue_id, :lat, :long
end
