# == Schema Information
#
# Table name: workouts
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  routine_id  :integer
#  exercise_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Workout < ActiveRecord::Base
	belongs_to :routine
	has_many :histories
  attr_accessible :exercise_id, :name, :pic, :routine_id, :sets

  def next
    routine.workouts.where("id > ?", id).order("id ASC").first
  end

  def prev
    routine.workouts.where("id < ?", id).order("id DESC").first
  end


end
