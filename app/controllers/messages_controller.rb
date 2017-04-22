class MessagesController < ApplicationController

  def new
    @message = Message.new
    # binding.pry
    @receiver = User.find(params[:id])
    # binding.pry
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
  #   messages = Message.find(session[:user_id])
      my_sent_messages
  end

  def inbox
  #   messages = Message.find(session[:user_id])
      my_received_messages

  end



  private

  def message_params
    params.require(:message).permit(:content, :user_id, :match_id)
  end

  def my_sent_messages
    @user = User.find(session[:user_id])
    @sent_messages = @user.sent_messages
  end

  def my_received_messages
    @user = User.find(session[:user_id])
    @received_messages = @user.received_messages
  end



end
