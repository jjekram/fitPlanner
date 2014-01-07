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
    @routine = Routine.find(@workout.routine_id)
    a = params[:workout]

    if !params[:workout][:sets].empty? && !params[:workout][:reps].empty?
      @history = History.new(:sets => params[:workout][:sets], :reps => params[:workout][:reps], :workout_id => @workout.id, :routine_id => @routine.id)
      @history.save
    end

    next_exercise_name = params[:workout][:next]

    if next_exercise_name != "Finish Routine"
      next_exercise = @routine.workouts.find_by_name(next_exercise_name)
    else
      next_exercise = @routine
    end

    
    redirect_to next_exercise
    
  end

  
end
