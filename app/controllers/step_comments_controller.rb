class Step_commentsController < ActionController::Base
  def new
    @step_comment = Step_comment.new
  end

  def create
    @step_comment = Step_comment.new(params[:step_comment])
    respond_to do |format|
      if @step_comment.save
        format.json { render json: "{'message':'step comment created successfully'}"}
      else
        format.json { render json: "{'message':'ERROR step comment not created'}"}
      end
    end
  end

  def comments
    @step = params[:step]
    comments = @step.comments
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