class DashboardController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @events = Event.upcoming
    @users = User.all.order('points DESC')
  end
end
