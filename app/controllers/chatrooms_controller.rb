class ChatroomsController < ApplicationController
  def show
    @users = User.where.not(id: current_user.id)
    @chatrooms = Chatroom.all
    @chatroom = Chatroom.find(params[:id])
    @new_chatroom = Chatroom.new
    @message = Message.new
  end

  def create
    @new_chatroom = Chatroom.new(new_chatroom_params)
    if @new_chatroom.save
      redirect_to chatrooms_path
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  def create_private_chatroom
    user = User.find(private_chatroom_params[:user_id])

    new_private_chatroom = Chatroom.new(is_private: true)
    new_private_chatroom.name = "#{user.nickname}/#{current_user.nickname}"

    if new_private_chatroom.save
      new_private_chatroom.users << ChatroomUser.new(user: user, chatroom: new_private_chatroom)
      new_private_chatroom.users << ChatroomUser.new(user: current_user, chatroom: new_private_chatroom)
      redirect_to new_private_chatroom
    else
      render "chatrooms/show", status: :unprocessable_entity
    end

  end

  private

  def private_chatroom_params
    params.require(:chatroom).permit(:user_id)
  end

  def new_chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
