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

#  def rate_user
#    @user = params[:user]
#    @user.rating = ((@user.rating * @user.numratings) + params[:rating]) / (@user.numratings + 1)
#    @user.numratings += 1
#    if @user.save
#      respond_to do |format|
#        format.json { render json: "rating successful" }
#      end
#    else
#      respond_to do |format|
#        format.json { render json: "rating failed" }
#      end
#    end
#  end


  def my_details
    dethash = Hash.new
    dethash["username"] = current_user.username
    dethash["rating"] = current_user.rating.to_i
    dethash["numposts"] = current_user.posts.count

    respond_to do |format|
      format.json{render json: dethash}
    end

  end

  def create
    @user = User.new(params[:user])
    @user.rating = 0
    respond_to do |format|
      if @user.save
        format.json { render json: "{'message':'user created successfully'}"}
      else
        format.json { render json: "{'message':'ERROR user not created'}"}
      end
    end
  end
end
