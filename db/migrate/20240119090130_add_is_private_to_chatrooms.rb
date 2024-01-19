class AddIsPrivateToChatrooms < ActiveRecord::Migration[7.1]
  def change
    add_column :chatrooms, :is_private, :boolean, default: false
  end
end
