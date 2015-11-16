class DashboardController < ApplicationController
  def index
    @users = User.all
    @workouts = Exercise.all
  end
end
