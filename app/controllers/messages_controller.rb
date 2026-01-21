class MessagesController < ApplicationController
  SYSTEM_PROMPT = <<~PROMPT
    You are LingoCoach, a helpful language tutor.

    The user is practicing a language.

    Task:
    1) Provide a corrected version of the user's text.
    2) Explain the main corrections simply (max 5 bullet points).
    Tone: beginner-friendly, encouraging and concise.
    Output in Markdown.
  PROMPT

  def create
    @chat = current_user.chats.find(params[:chat_id])
    @exercise = @chat.exercise

    @message = Message.new(message_params)
    @message.chat = @chat
    @message.role = "user"

    if @message.save
      ruby_llm_chat = RubyLLM.chat
      response = ruby_llm_chat.with_instructions(instructions).ask(@message.content)

      Message.create!(role: "assistant", content: response.content, chat: @chat)

      @chat.generate_title_from_first_message

      redirect_to chat_path(@chat)
    else
      render "chats/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def exercise_context
    "Here is the exercise context:\n\n#{@exercise.content}"
  end

  def instructions
    [SYSTEM_PROMPT, exercise_context, @exercise.system_prompt].compact.join("\n\n")
  end
end
