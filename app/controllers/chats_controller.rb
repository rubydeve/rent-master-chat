class ChatsController < ApplicationController
  before_action :authenticate_user!, :require_login

  def index
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

  def require_login 
    redirect_to root_url  if !current_user
    if current_user
      # @chatrooms = Chatroom.joins(:chats).order('chats.created_at DESC').uniq.limit(10)


      @chatrooms = Chatroom.joins(:chats)
  .select('chatrooms.*, MAX(chats.created_at) AS latest_publication_date')
  .group('chatrooms.id')
  .order('latest_publication_date DESC')
    end 
  end
end
