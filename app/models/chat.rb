class Chat < ApplicationRecord
  enum by_user: [:admin, :user]
  after_create_commit { MessageBroadcastJob.perform_later self }
  belongs_to :chatroom
end
