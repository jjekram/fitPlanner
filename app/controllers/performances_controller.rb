class PerformancesController < ApplicationController
	before_filter :logged_in_user
  
  	def show
	  	@routine = Routine.find(params[:id])
	  	
	    
	 end
  

	  def index
	  	 @routines = Routine.all
	  end

	  private
	    def logged_in_user
	        redirect_to login_path, notice: "Please log in." unless logged_in?
	    end
end
