class ChatroomsController < ApplicationController
  layout 'chat'
  
  def index
    return unless params[:info]
    @chatroom = Chatroom.find_or_create_by(name: params[:info])
    @chats = @chatroom.chats.last(50)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    render json: @chatroom.chats
  end
  
  private
  
  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
