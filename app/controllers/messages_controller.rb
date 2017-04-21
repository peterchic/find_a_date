class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    # message = Message.new(content: params[:message][:content], user_id: session[:user_id], match_id: params[:id])
    #  #binding.pry
    # if message.valid?
    #    message.save
    #    redirect_to sent_messages_path(session[:user_id])
    #  else
    #    render_to new_message_path
    #  end
  end

  def outbox
  #   messages = Message.find(session[:user_id])
      @user = User.find(sessions[:user_id])
  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id, :match_id)
  end



end
