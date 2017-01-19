class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_leaderboard, :set_top_bugs, :set_timeline

  def set_leaderboard
    @leaderboard = User.leaderboard
  end

  def set_top_bugs
    @topbugs = Bug.top(5).includes(:tags)
  end

  def set_timeline
    @timeline = Event.order(created_at: :desc).limit(5)
  end
end
