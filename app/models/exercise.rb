# == Schema Information
#
# Table name: exercises
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  instruction :text
#  pic         :text
#  page_id     :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  routine_id  :integer
#

class Exercise < ActiveRecord::Base
	belongs_to :routine 
  	attr_accessible :instruction, :page_id, :pic, :title, :routine_id
end
