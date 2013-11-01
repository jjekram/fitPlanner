require 'json'
require 'open-uri'
module StaticPagesHelper
	result = JSON.parse(open("http://en.wikipedia.org/w/api.php?action=query&list=categorymembers&cmtitle=Category:Weight%20training%20exercises&cmlimit=max&format=json").read)
	
	def getList() 
		#@result = JSON.parse(open("http://en.wikipedia.org/w/api.php?action=query&list=categorymembers&cmtitle=Category:Weight%20training%20exercises&cmlimit=max&format=json").read)
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
