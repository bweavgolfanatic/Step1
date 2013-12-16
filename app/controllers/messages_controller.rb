class MessagesController < ApplicationController

  def send_message
      msg = Message.new
      msg.body = params[:body]
      msg.sender = (User.find(session[:user_id]) if session[:user_id]).id
      msg.user_id = User.find_by_username(params[:recipient]).id
      msg.save
  end

  def my_messages
    @messages = Message.where("recipient = ?",(User.find(session[:user_id]) if session[:user_id]).id).all
    respond_to do |format|
      format.json {render json: @messages}
    end
  end

end

