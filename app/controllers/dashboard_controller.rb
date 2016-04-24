class DashboardController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @rushes = current_user.rushes
  end
end
