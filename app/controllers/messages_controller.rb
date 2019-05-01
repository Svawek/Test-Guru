class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_param)
    if @message.deliver
      redirect_to tests_path, notice: 'Message sent'
    else
      render :new
    end
  end

  private

  def message_param
    params.require(:message).permit(:name, :email, :body)
  end

end
