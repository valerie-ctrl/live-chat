class ChatroomsController < ApplicationController
  def show
    @users = User.where.not(id: current_user.id)
    @chatrooms = Chatroom.all
    @chatroom = Chatroom.find(params[:id])
    @new_chatroom = Chatroom.new
    @message = Message.new
    if @chatroom.is_private
      @chatroom_name = @chatroom.users.reject { |user| user == current_user }.first.nickname
    else
      @chatroom_name = @chatroom.name
    end
  end

  def create
    @new_chatroom = Chatroom.new(new_chatroom_params)
    if @new_chatroom.save
      redirect_to chatrooms_path
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  # Chatroom between two users
  def create_private_chatroom
    existing_chatroom = Chatroom.find_existing_private_chatroom(user_ids)

    if existing_chatroom
      redirect_to existing_chatroom
    else
      new_private_chatroom = Chatroom.new(is_private: true)
      new_private_chatroom.name = "#{user.nickname}/#{current_user.nickname}"

      if new_private_chatroom.save
        add_chatroom_users(new_private_chatroom, user, current_user)
        redirect_to new_private_chatroom
      else
        render "chatrooms/show", status: :unprocessable_entity
      end
    end
  end

  private

  def add_chatroom_users(new_private_chatroom, user, current_user)
    new_private_chatroom.chatroom_users << ChatroomUser.new(user: user, chatroom: new_private_chatroom)
    new_private_chatroom.chatroom_users << ChatroomUser.new(user: current_user, chatroom: new_private_chatroom)
  end

  # User ids for private chatroom
  def user_ids
    user = User.find(private_chatroom_params[:user_id])
    [user.id, current_user.id]
  end

  def private_chatroom_params
    params.require(:chatroom).permit(:user_id)
  end

  def new_chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
