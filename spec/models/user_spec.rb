require 'rails_helper'

RSpec.describe User, type: :model do
  it "has many messages and destroys them when destroyed" do
    user = User.reflect_on_association(:messages)
    expect(user.macro).to eq(:has_many)
    expect(user.options[:dependent]).to eq(:destroy)
  end

  it "has many chatroom_users and destroys them when destroyed" do
    user = User.reflect_on_association(:chatroom_users)
    expect(user.macro).to eq(:has_many)
    expect(user.options[:dependent]).to eq(:destroy)
  end

  it "has many chatrooms through chatroom_users" do
    user = User.reflect_on_association(:chatrooms)
    expect(user.macro).to eq(:has_many)
    expect(user.options[:through]).to eq(:chatroom_users)
  end
end
