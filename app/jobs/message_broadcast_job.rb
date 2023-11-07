class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(chat)
    ActionCable.server.broadcast "chat_channel_#{chat.chatroom.name}",
                                 { message: chat.message.html_safe, by: chat.admin?, token: chat.id }
  end
end
