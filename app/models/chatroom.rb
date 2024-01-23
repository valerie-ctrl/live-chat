class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :chatroom_users
  has_many :users, through: :chatroom_users
  validates_uniqueness_of :name

  def self.find_existing_private_chatroom(user1_id, user2_id)
    Chatroom.joins(chatroom_users: :user)
      .where(is_private: true)
      .where(users: { id: [user1_id, user2_id] })
      .group('chatrooms.id')
      .having('COUNT(chatrooms.id) = 2')
      .first
  end
end
