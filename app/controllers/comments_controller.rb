class CommentsController < ActionController::Base
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params[:comment])
    respond_to do |format|
      if @comment.save
        format.json { render json: "{'message':'comment created successfully'}"}
      else
        format.json { render json: "{'message':'ERROR comment not created'}"}
      end
    end
  end

  def rate_comment
    @comment = params[:comment]
    value = @comment.rating * @comment.num_ratings
    value += params[:rating]
    @comment.num_ratings += 1
    @comment.rating = value / @comment.num_ratings
    respond_to do |format|
      if @comment.save
        format.json { render json: "{'message':'comment rated successfully'}"}
      else
        format.json { render json: "{'message':'ERROR comment not rated'}"}
      end
    end

  end

  def comments
    @post = Post.find(params[:post])
    comments = @post.comments
    cms = Hash.new
    comments.each do |comment|
      subhsh = Hash.new
      subhsh[user]= comment.user
      subhsh[text] = comment.text
      subhsh[date] = comment.created_at
      cms[comment.id] = subhsh
    end
  end

end