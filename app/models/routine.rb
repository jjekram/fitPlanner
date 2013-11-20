# == Schema Information
#
# Table name: routines
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  days       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Routine < ActiveRecord::Base
	belongs_to :user
	has_many :workouts
  attr_accessible :days, :name, :user_id
end
