module ExercisesHelper
def get_image_url(pageid)

		image_list=JSON.parse(open("http://en.wikipedia.org/w/api.php?action=query&pageids="+pageid.to_s+"&prop=images&imlimit=20&format=json").read)
        first_image = image_list["query"]["pages"][pageid.to_s]["images"][0]['title']
        image_info=JSON.parse(open("http://en.wikipedia.org/w/api.php?action=query&titles="+first_image+"&prop=imageinfo&iiprop=url&format=json").read)
        
        image_url = image_info["query"]["pages"]["-1"]["imageinfo"][0]["url"]
        image_url
	end	
end
