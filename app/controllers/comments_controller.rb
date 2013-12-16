class CommentsController < ActionController::Base
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new
    @comment.text = params[:text]
    @comment.post_id = Post.find_by_title(params[:post_title]).id
    @comment.num_ratings = 0
    @comment.rating = 0.0
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.json { render json: "{'message':'comment created successfully'}"}
      else
        format.json { render json: "{'message':'ERROR comment not created'}"}
      end
    end
  end

  def rate_comment
    @comment = Comment.find(params[:comment])
    value = @comment.rating * @comment.num_ratings
    value += params[:rating]
    @comment.num_ratings += 1
    @comment.rating = value / @comment.num_ratings
    respond_to do |format|
      if @comment.save
        @votee = @comment.user
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

  def comments
    @post = Post.find_by_title(params[:post])
    comments = @post.comments
    cms = Hash.new
    comments.each do |comment|
      subhsh = Hash.new
      subhsh[user]= comment.user
      subhsh[text] = comment.text
      subhsh[date] = comment.created_at
      cms[comment.id] = subhsh
    end
    respond_to do |format|
      format.json { render json: cms}
    end


  end

end