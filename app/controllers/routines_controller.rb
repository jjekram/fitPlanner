class RoutinesController < ApplicationController
  before_filter :logged_in_user
  # GET /routines
  # GET /routines.json
  def index
    @routines = Routine.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @routines }
    end
  end

  # GET /routines/1
  # GET /routines/1.json
  def show
    @routine = Routine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @routine }
    end
  end

  # GET /routines/new
  # GET /routines/new.json
  def new
    @routine = Routine.new
    @exercises = Exercise.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @routine }
    end
  end

  # GET /routines/1/edit
  def edit
    @routine = Routine.find(params[:id])

    # get all the days for this routine
    @routine_days = @routine.days.split(", ")

    @workouts = []
    # get all the exercises for this routine
    @routine.workouts.each do |workout|
        @workouts << workout[:name]
    end

    # get a list of exercises
    @exercises = Exercise.all
  end

  # POST /routines
  # POST /routines.json
  def create

    # get the parameters from the viewer
    params[:routine][:user_id] = current_user.id

    # parse the days as needed and save it in an array.
    if params[:routine][:days]
        params[:routine][:days] = params[:routine][:days].keys.join(', ')
    end

    # create a new routine
    @routine = Routine.new(params[:routine])

    # get the name of all the exercises
    if params[:workout]
      params[:workout] = params[:workout].keys
    end


    respond_to do |format|
      if @routine.save
        # if at lest one exercise is selected then save the routine.
        if params[:workout]
          params[:workout].each do |workout|
            @workout=Workout.new(:name => workout, :routine_id => @routine.id)
            @workout.save
          end
        end
        #  print the success message
        format.html { redirect_to @routine, notice: 'Routine was successfully created.' }
        format.json { render json: @routine, status: :created, location: @routine }
      else
        format.html { render action: "new" }
        format.json { render json: @routine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /routines/1
  # PUT /routines/1.json
  def update
    @routine = Routine.find(params[:id])
    workout_names = []
  # find the days selected in the view 
    if params[:routine][:days]
        params[:routine][:days] = params[:routine][:days].keys.join(', ')
    end
    # find the exercises selected in the view
    if params[:workout]
      params[:workout] = params[:workout].keys
    end
    
    respond_to do |format|

      if @routine.update_attributes(params[:routine])
        # if at least one exercise is selected
        if params[:workout]
          # deleting previous exercises
          @routine.workouts.each do |single_workout|
            workout_names << single_workout.name
            if !params[:workout].include? (single_workout.name)
              single_workout.destroy
            end
          end

          # adding the  current exercises
          params[:workout].each do |workout|
            if !workout_names.include?(workout)
              @workout=Workout.new(:name => workout, :routine_id => @routine.id)
              @workout.save
            end
          end
        end
        format.html { redirect_to @routine, notice: @routine.name + " has updated."}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @routine.errors, status: :unprocessable_entity }
      end

    end
  end

  # DELETE /routines/1
  # DELETE /routines/1.json
  def destroy

    # delete all the exercises
    @routine = Routine.find(params[:id])
    @routine.destroy

    respond_to do |format|
      format.html { redirect_to routines_url }
      format.json { head :no_content }
    end
  end
  private
      def logged_in_user
          redirect_to login_path, notice: "Please log in." unless logged_in?
      end
end
