class ChatsController < ApplicationController
  def index
    @chats = Chat.all
  end

  def create
    @chat = Chat.create!

    redirect_to chat_path(@chat.session_id)
  end

  def show
    @chat = Chat.find_by(session_id: params[:id])
  end
end
