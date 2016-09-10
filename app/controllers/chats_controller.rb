class ChatsController < ApplicationController
  def index
    @chats = Chat.all
    @answers = ['いいね', '最高', '素晴らしい', '半端ない！']
    @new_message = Chat.new
  end

  def create
    @chat = Chat.new(chat_params)
    @chat.save
    redirect_to '/chats'
  end

  def destroy
    Chat.destroy_all
    redirect_to '/chats'
  end

  private

  def chat_params
    params.require(:chat).permit(:message)
  end
end
