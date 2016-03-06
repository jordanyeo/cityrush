class Clue < ActiveRecord::Base
  belongs_to :event
  has_many :submissions
end
