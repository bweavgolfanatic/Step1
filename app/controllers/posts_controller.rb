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

  def create
    @post = Post.new
    @post.user_id = (User.find(session[:user_id]) if session[:user_id]).id
    puts @post.user_id
    @post.rating = 0.0
    @post.num_ratings = 0
    @post.isfinished = 0
    @post.difficulty = params[:difficulty].to_i
    if @post.difficulty > 10
      @post.difficulty = 10
    else if @post.difficulty < 1
        @post.difficult = 1
    end
    @post.ispublic = params[:ispublic].to_i
    @post.title = params[:title]
    @post.category = params[:category]
    puts params[:ispublic]
    puts @post.isfinished
    respond_to do |format|
      if @post.save
        format.json { render json: "{'message':'post created successfully'}"}
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

    repond_to do |format|
      format.json {render json: j_posts}
    end
  end

  def user_posts
    j_posts = Hash.new
    @posts = Post.where("user_id = ?", User.find_by_username(params[:username])).find_each do |post|
      j_posts[post.id] = post.title
    end

    repond_to do |format|
      format.json {render json: j_posts}
    end
  end

  def popular
    json_posts = Hash.new
    Post.where("ispublic = ? AND isfinished = ?", true, true).order(num_ratings: :desc).find_each do |post|
      json_posts[post.id] = post.title
    end

    respond_to do |format|
      format.json {render json: json_posts}
    end
  end

  def latest
    json_posts = Hash.new
    Post.where("ispublic = ? AND isfinished = ?", true, true).order(created_at: :desc).find_each do |post|
      json_posts[post.id] = post.title
    end

    respond_to do |format|
      format.json {render json: json_posts}
    end
  end

  def oldest
    json_posts = Hash.new
    Post.where("ispublic = ? AND isfinished = ?", true, true).order(created_at :asc).find_each do |post|
      json_posts[post.id] = post.title
    end

    respond_to do |format|
      format.json {render json: json_posts}
    end
  end
end