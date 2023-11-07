class Chat < ApplicationRecord
  enum by_user: %i[admin user]
  after_create_commit { MessageBroadcastJob.perform_later self }
  after_create_commit { NotificationBroadcastJob.perform_later self }



  scope :unread_admin, -> { where(by_user: 'user', read: false) }

  belongs_to :chatroom
  validates :message, presence: true, allow_blank: false
end
