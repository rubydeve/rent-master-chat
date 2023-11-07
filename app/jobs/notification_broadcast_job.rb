class NotificationBroadcastJob < ApplicationJob
  queue_as :default
  def perform(chat)
    ActionCable.server.broadcast 'notification_channel',
                                 { info: chat.chatroom.info, by: chat.admin?, chatroom_id: chat.chatroom_id, unread: chat.chatroom.chats.unread_admin.count }
  end
end
