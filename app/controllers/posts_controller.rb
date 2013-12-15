class PostsController < ActionController::Base
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
    respond_to do |format|
      format.json { render json: @posts }
    end
  end

  def search_posts
    msg = Hash.new
    Post.find_each do |post|
      if post.title.include? params[:search]
        msg[post.id] = post.title
      end
    end
    respond_to do |format|
      format.json {render json: msg}
    end
  end

  def setfinished
    msg = Hash.new
    @post = Post.find(params[:post_id])
    @post.isfinished = 1
    if @post.save
      msg["message"] = "finished"
      respond_to do |format|
        format.json{render json: msg}
      end
    else
      msg["message"]="error"
      respond_to do |format|
        format.json{render json: msg}
        
      end
    end
  end

  def getapost
    @post = Post.find_by_title(params[:title])
    respond_to do |format|
      
      format.json { render json: @post }
    end
  end

  def create
    hsh = Hash.new
    @post = Post.new
    @post.user_id = (User.find(session[:user_id]) if session[:user_id]).id
    puts @post.user_id
    @post.rating = 0.0
    @post.num_ratings = 0
    @post.isfinished = 0
    @post.difficulty = params[:difficulty].to_i
    if @post.difficulty > 10
      @post.difficulty = 10
    elsif @post.difficulty < 1
        @post.difficulty = 1
    end
    @post.ispublic = params[:ispublic].to_i
    @post.title = params[:title]
    @post.category = params[:category]
    puts params[:ispublic]
    puts @post.isfinished
    respond_to do |format|
      if @post.save
        hsh['message'] = 'post created successfully'
        hsh['postid'] = @post.id
        format.json { render json: hsh}
      else
        puts @post.errors.messages.inspect
        format.json { render json: "{'message':'ERROR post not created'}"}
      end
    end
  end

  def rate_post
    @post = Post.find(params[:post])
    value = @post.rating * @post.num_ratings
    value += params[:rating]
    @post.num_ratings += 1
    @post.rating = value / @post.num_ratings
    respond_to do |format|
      if @post.save
        @votee = @post.user
        total = @votee.rating * @votee.num_ratings
        @votee.num_ratings += 1
        @votee.rating = total / @votee.num_ratings
        @votee.save
        format.json { render json: "{'message':'comment rated successfully'}"}
      else
        format.json { render json: "{'message':'ERROR comment not rated'}"}
      end
    end

  end

  def category_posts
    j_posts = Hash.new
    @posts = Post.where("category = ?", params[:category]).find_each do |post|
      j_posts[post.id] = post.title
    end

    respond_to do |format|
      format.json {render json: j_posts}
    end
  end

  def user_posts
    j_posts = Hash.new
    @posts = Post.where("user_id = ?", User.find_by_username(params[:username])).find_each do |post|
      j_posts[post.id] = post.title
    end

    respond_to do |format|
      format.json {render json: j_posts}
    end
  end

  def popular
    i = 1
    json_posts = Hash.new
    Post.where("ispublic = ?", 1).order(num_ratings: :desc).find_each do |post|
      json_posts[i] = post.title
      i +=1
    end

    respond_to do |format|
      format.json {render json: json_posts}
    end
  end

  def latest
    i = 1
    json_posts = Hash.new
    @posts = Post.where("ispublic = ?", 1).order("id desc").find_each do |post|
      json_posts[i] = post.title
      i += 1

    end

    respond_to do |format|
      format.json {render json: json_posts}
    end
  end

  def oldest
    i = 1
    json_posts = Hash.new
    Post.where("ispublic = ?", 1).order("id asc").find_each do |post|
      json_posts[i] = post.title
      i+= 1
    end

    respond_to do |format|
      format.json {render json: json_posts}
    end
  end
end