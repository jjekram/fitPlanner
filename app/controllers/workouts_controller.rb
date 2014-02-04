class WorkoutsController < ApplicationController
  before_filter :logged_in_user
  def show
  	@workout=Workout.find(params[:id])
  	@routine = Routine.find(@workout.routine_id)
  end

  def edit
  	@workout=Workout.find(params[:id])
  	#format.html { redirect_to @workout, notice: 'Routine was successfully created.' }
  end

# this function add the flow of exercises.
# allows users to add their workout data when they are working out
  def update

    # find the workout_is from the view
  	@workout=Workout.find(params[:id])
    @routine = Routine.find(@workout.routine_id)
    a = params[:workout]

    # if the 'sets' and 'reps' textfield is not empty 
    if !params[:workout][:sets].empty? && !params[:workout][:reps].empty?
      # at this point we know that the user completed an exercise 
      # so, we add the exercise record to the history
      @history = History.new(:sets => params[:workout][:sets], :reps => params[:workout][:reps], :workout_id => @workout.id, :routine_id => @routine.id, :weight => params[:workout][:weight], :workout_name=>@workout.name)
      @history.save
    end

    # creating link for next exercise
    next_exercise_name = params[:workout][:next]

    # if the user didn't complete their routine for the day
    if next_exercise_name != "Finish Routine"
      # we redirect to the next exercise they selected
      next_exercise = @routine.workouts.find_by_name(next_exercise_name)
    else
      # if user completed the routine, the redirect him/her to routine page
      flash[:notice] = "Congratulation! You completed this routine today. Click on 'Performance History' for workout record. "
      next_exercise = @routine
    end

    # redirecting the user
    redirect_to next_exercise
    
  end
  private

    def logged_in_user
      redirect_to login_path, notice: "Please log in." unless logged_in?
    end
  
end
