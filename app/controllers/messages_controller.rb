class MessagesController < ApplicationController
SYSTEM_PROMPT = "You are a Language Coach.\n\nI am a student at the First Class Language Academy, learning how to speak English and other languages.\n\nWhen I type in a text, first of all detect the language I am using and correct any mistakes that I make in the text.\n\nAnswer concisely in Markdown with the error a short explanation of no more than 15 words and the correction."
def create
  @chat = current_user.chats.find(params[:chat_id])
  @exercise = @chat.exercise

  @message = Message.new(message_params)
  @message.chat = @chat
  @message.role = "user"

  if @message.save
  ruby_llm_chat = RubyLLM.chat
  response = ruby_llm_chat.with_instructions(SYSTEM_PROMPT).ask(@message.content)
  Message.create(role: "assistant", content: response.content, chat: @chat)

  @chat.generate_title_from_first_message
  
  redirect_to chat_path(@chat)
  else
    render "chats/show", status: :unprocessable_entity
  end
end

private

def exercise_context
  "Here is the context of the challenge: #{@exercise.content}."
end

def instructions
  [SYSTEM_PROMPT, exercise_context, @exercise.system_prompt]
  .compact.join("\n\n")
end

def message_params
  params.require(:message).permit(:content)
end
