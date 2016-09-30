class MessagesController < ApplicationController

  before_action :find_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.order("created_at DESC")
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @message.update_attributes(message_params)
      redirect_to message_path(@message), notice: "Message updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @message.destroy
    redirect_to root_path, notice: "Message deleted successfully."
  end

  private

    def message_params
      params.require(:message).permit(:title, :description)
    end
end
