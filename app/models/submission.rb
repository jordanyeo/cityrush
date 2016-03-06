class Submission < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  belongs_to :clue
  
  validates_presence_of :guess
  before_save :check_guess
  
  private
  
  def check_guess
    if guess == self.clue.answer
      self.correct = true
    else
      self.correct = false
    end
  end
end
