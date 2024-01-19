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
    @new_private_chatroom = Chatroom.new
  end

  private

  def private_chatroom_params
    params.require(:private_chatroom).permit(:user_id)
  end

  def new_chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
