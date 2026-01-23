class ChatsController < ApplicationController
  # def index
  #   @exercise = Exercise.find(params[:exercise_id])
  #   @chats = Chat.new(exercise: @exercise)
  # end

def create
  @exercise = Exercise.find(params[:exercise_id])

  @chat = Chat.new(title: Chat::DEFAULT_TITLE)
  @chat.exercise = @exercise
  @chat.user = current_user

  respond_to do |format|
    if @chat.save
      format.turbo_stream
      format.html { redirect_to exercise_path(@exercise) }
    else
      @chats = @exercise.chats.where(user: current_user)
      format.html { render "exercises/show", status: :unprocessable_entity }
    end
  end
end

  def destroy
    @chat = Chat.find(params[:id])
    exercise = @chat.exercise
    @chat.destroy
    redirect_to exercise_path(exercise), notice: "Chat deleted.", status: :see_other
  end


  def show
    @chat = Chat.find(params[:id])

    if turbo_frame_request?
      render :show, layout: false
    end
  end
end
