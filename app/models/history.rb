# == Schema Information
#
# Table name: histories
#
#  id         :integer          not null, primary key
#  sets       :integer
#  reps       :integer
#  workout_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  routine_id :integer
#

class History < ActiveRecord::Base
	belongs_to :workout
	belongs_to :routine
  	attr_accessible :reps, :sets, :workout_id, :routine_id
end
