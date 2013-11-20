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

require 'test_helper'

class ExerciseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
