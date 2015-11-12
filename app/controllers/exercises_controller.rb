class ExercisesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_exercise, except: [:index, :new, :create]

  def index

  end

  def new
    @exercise = current_user.exercises.new
  end

  def create
    @exercise = current_user.exercises.build(exercise_params)

    if @exercise.save
      flash[:success] = "Your workout was added."
      redirect_to user_exercise_path(current_user, @exercise)
    else
      flash[:danger] = "An error occurred, please try submitting your workout again."
      render :new
    end
  end

  private
    def exercise_params
      params.require(:exercise).permit(:name, :work_sets, :details, :workout_date)
    end

    def set_exercise
      @exercise = current_user.exercises.find(params[:id])
    end
end
