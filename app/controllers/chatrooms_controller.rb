class ChatroomsController < ApplicationController
  def show
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

  private

  def new_chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
