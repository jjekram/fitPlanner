require 'json'
require 'open-uri'
module StaticPagesHelper
	#result = JSON.parse(open("http://en.wikipedia.org/w/api.php?action=query&list=categorymembers&cmtitle=Category:Weight%20training%20exercises&cmlimit=max&format=json").read)
	
	def getList() 
		result = JSON.parse(open("http://en.wikipedia.org/w/api.php?action=query&list=categorymembers&cmtitle=Category:Weight%20training%20exercises&cmlimit=max&format=json").read)
		single_exercise=result["query"]["categorymembers"][0]
		image_list=JSON.parse(open("http://en.wikipedia.org/w/api.php?action=query&pageids="+single_exercise['pageid'].to_s+"&prop=images&imlimit=20&format=json").read)
        first_image = image_list["query"]["pages"][single_exercise["pageid"].to_s]["images"][0]['title']
        image_info=JSON.parse(open("http://en.wikipedia.org/w/api.php?action=query&titles="+first_image+"&prop=imageinfo&iiprop=url&format=json").read)
        
        image_url = image_info["query"]["pages"]["-1"]["imageinfo"][0]["url"]
        image_url
=begin
		exercise_arr = result["query"]["categorymembers"]
		i = 0
		str=exercise_arr[i]["title"]
		i+=1
		str=exercise_arr[i]["title"] + str
		str
=end
	end
end
