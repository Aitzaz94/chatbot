class ChatMessagesController < ApplicationController
    def create
        @chat = Chat.find(params[:chat_id])
        @chat_message = @chat.chat_messages.create(chat_message_params)

        if @chat_message.save

            ChatMessageCreatedJob.perform_later(@chat_message)

            render turbo_stream: turbo_stream.append(
            "chat_messages_#{@chat.id}",
            partial: "chat_messages/chat_message",
            locals: { chat_message: @chat_message }
            )
        else
            render json: @chat_message.errors, status: :unprocessable_entity
        end
    end

    private

    def chat_message_params
        params.require(:chat_message).permit(:content)
    end
end
