class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.string :message
      t.integer :by_user, default: 0
      t.belongs_to :chatroom
      t.boolean :read, default: false
      t.timestamps
    end
  end
end
