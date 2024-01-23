# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


User.destroy_all
puts "Deleting old users..."

Message.destroy_all
puts "Deleting old messages..."

Chatroom.destroy_all
puts "Deleting old chatrooms..."

Chatroom.create(name: "music")
User.create(email: "carl@email.com", nickname: "Carl", password: "123456")
User.create(email: "luis@email.com", nickname: "Luis", password: "123456")
User.create(email: "valeriia@email.com", nickname: "Val", password: "123456")
