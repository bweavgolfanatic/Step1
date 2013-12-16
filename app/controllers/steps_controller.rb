class StepsController < ActionController::Base
  def new
    @step = Step.new
  end

  def index
    @steps = Step.all
    respond_to do |format|
      format.json { render json: @steps }
    end
  end


  def show
    @step = Step.find(params[:id])
    puts @step.id
    puts @step.post_id
    puts @step.text

    hsh = Hash.new
    hsh['picture']= @step.pic
    hsh['text'] = @step.text
    @stepps = Step.where("post_id = ? AND id > ?", @step.post_id, @step.id).order("id ASC")
    if !@stepps.nil? and !@stepps[0].nil?
      hsh['next_step_id'] = @stepps[0].id
    else
      hsh['next_step_id'] = -5
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: hsh }
    end
  end

  def create
    @step = Step.new
    @step.text = params[:text]
    @step.post_id = params[:post_id]
    @step.pic = params[:pic]
    respond_to do |format|
      if @step.save
        format.json { render json: "{'message':'step created successfully'}"}
      else
        puts @step.errors.messages.inspect
        format.json { render json: "{'message':'ERROR step not created'}"}
      end
    end
  end

end