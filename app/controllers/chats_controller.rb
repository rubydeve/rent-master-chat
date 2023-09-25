class ChatsController < ApplicationController
    before_action :authenticate_user!
    def index
        @chatrooms = Chatroom.all
    end
    
    def create
        @chat = Chat.new(chat_params)
        respond_to do |format|
            if @chat.save
                format.json { render :show, status: :created, location: @chat }
            else
                format.json { render json: @chat.errors, status: :unprocessable_entity }
            end
        end
    end

    def new
        @chat = Chat.new
    end
    
    def show
        @chatroom = Chatroom.find_by_id(params[:id])
        @chats = Chat.where(chatroom_id: params[:id])
    end
    
    private
        def chat_params
            params.require(:chat).permit(:message, :name, :chatroom_id)
        end
end
      