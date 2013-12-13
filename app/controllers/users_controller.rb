class UsersController < ApplicationController
  skip_before_filter :signed_in_user, only: [:new,:create]
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def index
    @users = User.all
    puts current_user
    puts "*****************"
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
    @user.num_ratings = 0
    if @user.save
      respond_to do |format|
        format.json { render json: "{'message':'user created successfully'}"}      
      end
    else
      respond_to do |format|
        format.json { render json: "{'message':'ERROR user not created'}"}
      end
    end
  end
end
