class ExercisesController < ApplicationController
  def index
    @exercises = Exercise.all
  end

  def show
    @exercise = Exercise.find(params[:id])
    @chats = @exercise.chats.where(user: current_user)
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise =Exercise.new(exercise_params)
    if @exercise.save
      redirect_to exercise_path(@exercise), notice: "Exercise created!"
    else
      render :new, status: unprocessable_entity
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :language, :content, :system_prompt)
  end
end
