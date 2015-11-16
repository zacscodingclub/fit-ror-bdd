class ExercisesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_exercise, except: [:index, :new, :create]

  def index
    @exercises = current_user.exercises.all
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
      flash[:danger] = "Workout couldn't be added.  Please try submitting it again."
      render :new
    end
  end

  def edit
  end

  def update
    if @exercise.update(exercise_params)
      flash[:success] = "Your workout was updated"
      redirect_to user_exercise_path(current_user, @exercise)
    else
      flash[:danger] = "Your workout couldn't be updated"
      redirect_to edit_user_exercise_path(current_user, @exercise)
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
