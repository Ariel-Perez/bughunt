class HomeController < ApplicationController
  def index
    @title = 'Dashboard'
    @tags = Tag.all
    @bugs = Bug.unsolved.order(score: :desc).includes(:tags)
  end
end
