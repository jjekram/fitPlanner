require 'json'
class StaticPagesController < ApplicationController
  before_filter :logged_in_user_notice, only: [:about]
  before_filter :logged_in_user, only: [:home]

  def about
  	
  end


  def home
    
=begin
  	result = JSON.parse(open("http://en.wikipedia.org/w/api.php?action=query&list=categorymembers&cmtitle=Category:Weight%20training%20exercises&cmlimit=max&format=json").read)
  	exercise_arr = result["query"]["categorymembers"]
    @urls = Array.new
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
	              	@urls << image_info["query"]["pages"]["-1"]["imageinfo"][0]["url"]
	              	image_selected = true
	              end
	            end
            end
          end
  	end
=end
  end
  private
    def logged_in_user_notice
        redirect_to login_path, notice: "Please log in." unless logged_in?
    end

    def logged_in_user
        redirect_to login_path unless logged_in?
    end
end
