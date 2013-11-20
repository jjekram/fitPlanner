# == Schema Information
#
# Table name: workouts
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  pic         :string(255)
#  routine_id  :integer
#  exercise_id :integer
#  sets        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Workout < ActiveRecord::Base
	belongs_to :routine
  attr_accessible :exercise_id, :name, :pic, :routine_id, :sets
end
