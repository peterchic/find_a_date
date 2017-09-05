class MessagesController < ApplicationController

  def new
    @message = Message.new
    @receiver = User.find(params[:id])
  end

  def create
    message = Message.new(content: params[:message][:content], user_id: session[:user_id], match_id: params[:message][:match_id])

    if message.valid?
       message.save
       redirect_to sent_messages_path
    else
       render_to new_message_path
    end
  end

  def outbox
    my_sent_messages
  end

  def inbox
    my_received_messages.each do |message|
      message.status = true
      message.save
    end
  end

  private

  def my_sent_messages
    @user = User.find(session[:user_id])
    @sent_messages = @user.sent_messages
  end

  def my_received_messages
    @user = User.find(session[:user_id])
    @received_messages = @user.received_messages
  end

  def message_params
    params.require(:message).permit(:content, :user_id, :match_id)
  end

end
