class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @picture.save
        format.json { render json: "{'message':'user created successfully'}"}
      else
        format.json { render json: "{'message':'ERROR user not created'}"}
      end
    end
  end
end
