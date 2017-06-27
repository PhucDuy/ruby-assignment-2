class MessagesController < ApplicationController
  def index
    @messages = current_user.received_messages
  end
  def new
    @users = current_user.friends
    @message = Message.new
  end
  def create
    @message = Message.new(message_params)
    @message.sender_id = current_user.id
    if @message.save
      flash[:success] = "Sent message"
      redirect_to messages_path
    else
      flash[:error] = "Error: #{@message.errors.full_messages.to_sentence}"
      render 'new'
    end
  end
  def sent_messages
    @messages = current_user.sent_messages

  end

  def show
    @message = Message.find_by(id: params[:id])
    if @mesasge.nil?
      @message.mark_as_read! :for => current_user
    end

  end
  private
  def message_params
    params.require(:message).permit(:body,:recipient_id)
  end
end
