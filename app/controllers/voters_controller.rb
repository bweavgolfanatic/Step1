class VotersController < ApplicationController
  def new
    @voter = Voter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @voter }
    end
  end

  def index
    @voters = Voter.all
    respond_to do |format|
      format.json { render json: @voters }
    end
  end

end
