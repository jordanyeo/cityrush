class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :invitable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :submissions
  
  def points
    self.submissions.count
  end
end
