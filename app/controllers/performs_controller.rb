class PerformsController < ApplicationController
  def show
  	@routine = Routine.find(params[:id])
  	
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @routine }
    end
  end
end
