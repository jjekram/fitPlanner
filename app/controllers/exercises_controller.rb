
class ExercisesController < ApplicationController
  # GET /exercises
  # GET /exercises.json
  def index
    @exercises = Exercise.all

    
  end

  # GET /exercises/1
  # GET /exercises/1.json
  def show
    @exercise = Exercise.find(params[:id])
  end

  # GET /exercises/new
  # GET /exercises/new.json
  def new
    @exercise = Exercise.new
    
  end

  # GET /exercises/1/edit
  def edit
    @exercise = Exercise.find(params[:id])
  end

  # POST /exercises
  # POST /exercises.json
  def create
    #@exercise = Exercise.new(params[:exercise])
    result = JSON.parse(open("http://en.wikipedia.org/w/api.php?action=query&list=categorymembers&cmtitle=Category:Weight%20training%20exercises&cmlimit=max&format=json").read)
    exercise_arr = result["query"]["categorymembers"]
    #@urls = Array.new
    exercise_arr.each do |single_exercise|
          image_list=JSON.parse(open("http://en.wikipedia.org/w/api.php?action=query&pageids="+single_exercise['pageid'].to_s+"&prop=images&imlimit=20&format=json").read)
          
          image_url = "Image not Available"
          if(image_list["query"]["pages"][single_exercise["pageid"].to_s]["images"])
            image_array = image_list["query"]["pages"][single_exercise["pageid"].to_s]["images"]
            image_selected = false
            image_array.each do |single_image|
              if(image_selected == false)
                image = single_image['title']
                image_info=JSON.parse(open(URI.encode("http://en.wikipedia.org/w/api.php?action=query&titles="+image+"&prop=imageinfo&iiprop=url&format=json")).read)
                if (image_info["query"]["pages"]["-1"])
                  image_url = image_info["query"]["pages"]["-1"]["imageinfo"][0]["url"]
                  image_selected = true
                end
              end
            end
          end
          @exercise = Exercise.new(:instruction => "none", :title =>single_exercise["title"], :page_id => single_exercise["pageid"], :pic=> image_url )
          @exercise.save
    end    
  end

  # PUT /exercises/1
  # PUT /exercises/1.json
  def update
    @exercise = Exercise.find(params[:id])

    respond_to do |format|
      if @exercise.update_attributes(params[:exercise])
        format.html { redirect_to @exercise, notice: 'Exercise was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  

  # DELETE /exercises/1
  # DELETE /exercises/1.json
  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy

    respond_to do |format|
      format.html { redirect_to exercises_url }
      format.json { head :no_content }
    end
  end
end
