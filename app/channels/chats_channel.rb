class ChatsChannel < ApplicationCable::Channel
  def subscribed
    puts params[:room].inspect
    stream_from "chat_channel_#{params[:room]}"
  end

  def unsubscribed
    stop_stream_from "chat_channel_#{params[:room]}"
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    chatroom_id = Chatroom.find_by_name(params[:room]).try(:id)
    if current_user.blank?
      c = Chat.create({message: data['message'], chatroom_id: chatroom_id, by_user: 'user'})
    else
      c = Chat.create({message: data['message'], chatroom_id: chatroom_id, by_user: 'admin'})
    end
  end

  def read(data)
    chat = Chat.find_by_id(data['token'])
    if current_user and chat.user?
      # if user not send chats and admin read
      chat.update(read: true)
    elsif current_user.blank? and chat.admin?
      # if admin send and user read 
      chat.update(read: true)
    end
    ActionCable.server.broadcast "chat_channel_#{params[:room]}",
                                 { read: true, token: chat.id, by: chat.admin? }
  end
end
