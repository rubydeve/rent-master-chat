class ChatroomsController < ApplicationController

    def index
        if params[:info]
            @chatroom = Chatroom.find_or_create_by(name: params[:info])
        end
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

