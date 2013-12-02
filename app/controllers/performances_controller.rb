class PerformancesController < ApplicationController
	before_filter :logged_in_user
  
  	def show
	  	@routine = Routine.find(params[:id])
	  	@histories_dates = []
	  	@routine.histories.order("created_at DESC").each do |single_history|
	  		@histories_dates << single_history.created_at.to_date
	  	end
	  	@histories_dates = @histories_dates.uniq

	  	@histories = []
	  	@routine.histories.order("created_at DESC").each do |history|
	  		@histories << history
	  	end
	 end

  

	  def index
	  	 @routines = Routine.all
	  end

	  private
	    def logged_in_user
	        redirect_to login_path, notice: "Please log in." unless logged_in?
	    end
end
