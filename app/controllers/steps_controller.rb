class StepsController < ActionController::Base
  def new
    @step = Step.new
  end

  def create
    @step = Step.new(params[:step])
    respond_to do |format|
      if @step.save
        format.json { render json: "{'message':'step created successfully'}"}
      else
        format.json { render json: "{'message':'ERROR step not created'}"}
      end
    end
  end

end