class Submission < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  belongs_to :clue
  
  validates_presence_of :guess
  after_create :update_user_points
  
  private
  
  def update_user_points
    if self.guess == self.clue.answer
      self.correct = true
      self.user.increment(:points, 5)
    else
      self.correct = false
      self.user.decrement(:points, 1)
    end
    self.save
    self.user.save
  end
end
