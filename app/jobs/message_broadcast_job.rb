class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(chat)
    puts 'ssssssssssssssssssssssssssssssssss'
    ActionCable.server.broadcast "chat_channel_#{chat.chatroom.name}", {message: chat.message, by: chat.admin?} 
  end

end
