class PerformancesController < ApplicationController
	before_filter :logged_in_user


  # GET /performances/1
  	def show
  		# find the routine 
	  	@routine = Routine.find(params[:id])

	  	# show all the dates where the user conducted the exercise
	  	@histories_dates = []
	  	@routine.histories.order("created_at DESC").each do |single_history|
	  		@histories_dates << single_history.created_at.to_date
	  	end

	  	# get unique dates
	  	@histories_dates = @histories_dates.uniq


	  	# show all the histories where for that exercise. 
	  	# Mostly, the list of exercises that was completed by the user
	  	@histories = []
	  	@routine.histories.order("created_at DESC").each do |history|
	  		@histories << history
	  	end
	 end

  

	  def index
	  	 @routines = Routine.all
	  end

	  private

	  # redirect to homepage if not logged in
	    def logged_in_user
	        redirect_to login_path, notice: "Please log in." unless logged_in?
	    end
end
