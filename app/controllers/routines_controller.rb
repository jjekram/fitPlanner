class RoutinesController < ApplicationController
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
    @exercises = Exercise.all
  end

  # POST /routines
  # POST /routines.json
  def create

    params[:routine][:user_id] = current_user.id
    @routine = Routine.new(params[:routine])


    respond_to do |format|
      if @routine.save
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

    if params[:routine][:days]
        params[:routine][:days] = params[:routine][:days].keys.join(', ')
    end

    if params[:workout]
      params[:workout] = params[:workout].keys
    end
    
    respond_to do |format|

      if @routine.update_attributes(params[:routine])
        if params[:workout]
          params[:workout].each do |workout|
            @workout=Workout.new(:name => workout, :routine_id => @routine.id)
            @workout.save
          end
        end
        format.html { redirect_to @routine, notice: params[:workout]}
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
    @routine = Routine.find(params[:id])
    @routine.destroy

    respond_to do |format|
      format.html { redirect_to routines_url }
      format.json { head :no_content }
    end
  end
end
