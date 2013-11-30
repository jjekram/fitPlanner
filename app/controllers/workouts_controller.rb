class WorkoutsController < ApplicationController
  def show
  	@workout=Workout.find(params[:id])
  	@routine = Routine.find(@workout.routine_id)
  end

  def edit
  	@workout=Workout.find(params[:id])
  	#format.html { redirect_to @workout, notice: 'Routine was successfully created.' }
  end

  def update
  	@workout=Workout.find(params[:id])
  	
  	format.html { redirect_to @workout, notice: 'Routine was successfully created.' }
  end
  
end
