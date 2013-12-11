class PostsController < ActionController::Base
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    respond_to do |format|
      if @post.save
        format.json { render json: "{'message':'post created successfully'}"}
      else
        format.json { render json: "{'message':'ERROR post not created'}"}
      end
    end
  end

#  def category
#    @posts = Post.where
#  end

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
    Post.where("ispublic = ? AND isfinished = ?", true, true).order(num_ratings: :asc).find_each do |post|
      json_posts[post.id] = post.title
    end

    respond_to do |format|
      format.json {render json: json_posts}
    end
  end
end