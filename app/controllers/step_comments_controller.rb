class Step_commentsController < ActionController::Base
  def new
    @step_comment = Step_comment.new
  end

  def create
    @step_comment = Step_comment.new(params[:step_comment])
    @step_comment.rating = 0.0
    @step_comment.num_ratings = 0
    @step_comment.user_id = (User.find(session[:user_id]) if session[:user_id]).id
    respond_to do |format|
      if @step_comment.save
        format.json { render json: "{'message':'step comment created successfully'}"}
      else
        format.json { render json: "{'message':'ERROR step comment not created'}"}
      end
    end
  end

  def rate_step_comment
    @comment = Step_comment.find(params[:Step_comment])
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
    @step = Step.find(params[:step].to_i)
    comments = @step.comments
    respond_to do |format|
      format.json { render json: comments}
    end
  end

end