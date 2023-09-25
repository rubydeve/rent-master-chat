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
    if defined?(current_user) and !current_user.blank?
      c = Chat.create({message: data['message'], chatroom_id: chatroom_id, by_user: 'admin'})
    else
      c = Chat.create({message: data['message'], chatroom_id: chatroom_id, by_user: 'user'})
    end
  end


end
