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

    if @chat.save
      redirect_to chat_path(@chat)
    else
      @chats = @exercise.chats.where(user: current_user)
      render "exercises/show", status: :unprocessable_entity
    end
  end

  def show
    @chat = Chat.find(params[:id])

    if turbo_frame_request?
      render :show, layout: false
    end
  end
end
