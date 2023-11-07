class Chatroom < ApplicationRecord
  has_many :chats
  def info
    "#CHT0#{name}"
  end
end
