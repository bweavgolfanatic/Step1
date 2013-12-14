class StepsController < ActionController::Base
  def new
    @step = Step.new
  end

  def create
    @step = Step.new
    @step.text = params[:text]
    @step.post_id = params[:post_id]
    @step.picture = params[:picture]
    respond_to do |format|
      if @step.save
        format.json { render json: "{'message':'step created successfully'}"}
      else
        format.json { render json: "{'message':'ERROR step not created'}"}
      end
    end
  end

end