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

end