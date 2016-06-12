class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :leaderboard
  
  def after_sign_in_path_for(resource)
    dashboard_url
  end
  
  private
  
  def leaderboard
    @cityrush_users = User.all.order('points DESC')
  end
end
