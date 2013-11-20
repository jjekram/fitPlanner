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

require 'test_helper'

class RoutineTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
