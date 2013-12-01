class History < ActiveRecord::Base
	belongs_to :workout_id
  	attr_accessible :reps, :sets, :workout_id
end
