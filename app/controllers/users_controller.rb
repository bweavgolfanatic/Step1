class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.all
    respond_to do |format|
      format.json { render json: @users }
    end
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        format.json { render json: "{'message':'user created successfully'}"}
      else
        format.json { render json: "{'message':'ERROR user not created'}"}
      end
    end
  end
end
