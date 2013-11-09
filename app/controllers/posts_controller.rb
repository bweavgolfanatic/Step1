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

end