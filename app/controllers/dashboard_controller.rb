class DashboardController < ApplicationController
  def index
    @users = User.paginate(:page => params[:user_page], :per_page => 4)
    @workouts = Exercise.paginate(:page => params[:exercise_page], :per_page => 4)
  end
end
