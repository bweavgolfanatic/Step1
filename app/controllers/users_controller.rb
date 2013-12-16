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
    if current_user.nil?
      @user = User.new(params[:user])
      @user.rating = 0
      @user.num_ratings = 0
      if @user.save
        respond_to do |format|
          format.json { render json: "{'message':'user created successfully'}"}
          format.html {redirect_to users_path}
        end
      else
        respond_to do |format|
          format.json { render json: "{'message':'ERROR user not created'}"}
        end
      end
    else
      respond_to do |format|
          format.json { render json: "{'message':'Please Sign Out'}"}
          format.html { redirect_to am_i_signed_in_path}
        end
    end
  end
end
