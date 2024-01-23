require 'rails_helper'

RSpec.describe Chatroom, type: :model do
  it 'has many messages and destroys them when destroyed' do
    chatroom = described_class.reflect_on_association(:messages)
    expect(chatroom.macro).to eq(:has_many)
    expect(chatroom.options[:dependent]).to eq(:destroy)
  end

  it 'has many chatroom_users' do
    chatroom = described_class.reflect_on_association(:chatroom_users)
    expect(chatroom.macro).to eq(:has_many)
  end

  it 'has many users through chatroom_users' do
    chatroom = described_class.reflect_on_association(:users)
    expect(chatroom.macro).to eq(:has_many)
    expect(chatroom.options[:through]).to eq(:chatroom_users)
  end

  describe '.find_existing_private_chatroom' do
    it 'returns the private chatroom if it exists' do
      user1 = User.create(email: "email@email.com", nickname: "buddy", password: "123456")
      user2 = User.create(email: "email2@email.com", nickname: "buddy2", password: "123456")
      chatroom = Chatroom.create(is_private: true)
      ChatroomUser.create(user: user1, chatroom: chatroom)
      ChatroomUser.create(user: user2, chatroom: chatroom)

      result = Chatroom.find_existing_private_chatroom(user1.id, user2.id)

      expect(result).to eq(chatroom)
    end

    it 'returns nil if the private chatroom does not exist' do
      user1 = User.create
      user2 = User.create

      result = described_class.find_existing_private_chatroom(user1.id, user2.id)

      expect(result).to be_nil
    end
  end
end
