class ChatsController < ApplicationController
  # def index
  #   @exercise = Exercise.find(params[:exercise_id])
  #   @chats = Chat.new(exercise: @exercise)
  # end

  def create
    @exercise = Exercise.find(params[:exercise_id])
    @chat = Chat.new(title: "Untitled")
    @chat.exercise = @exercise
    @chat.user = current_user

    if @chat.save
      redirect_to chat_path(@chat)
    else
      @chats = @exercises.chats.where(user: current_user)
      render "challenges/show"
    end
  end

  def show
    @chat    = current_user.chats.find(params[:id])
    @message = Message.new
  end
end
