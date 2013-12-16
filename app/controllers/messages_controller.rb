class MessagesController < ApplicationController

  def send_message
      hsh = Hash.new
      @msg = Message.new
      @msg.body = params[:body]
      @msg.subject = params[:subject]
      @msg.sender = (User.find(session[:user_id]) if session[:user_id]).id
      @msg.recipient = User.find_by_username(params[:recipient]).id
      if @msg.save
        hsh['message']="success"
      else
        hsh['message']="failure"
      end
      respond_to do |format|
          format.json {render json: hsh}
      end

  end

  def my_messages
    @messages = Message.where("recipient = ?",(User.find(session[:user_id]) if session[:user_id]).id).all
    respond_to do |format|
      format.json {render json: @messages}
    end
  end

end

