class DashboardController < ApplicationController
  def index
    @users = User.paginate(:page => params[:user_page], :per_page => 4)
    @workouts = Exercise.paginate(:page => params[:exercise_page], :per_page => 4)
  end

  def search
    @users = User.search_by_name(params[:search_name]).paginate(:page => params[:page])
  end
end
