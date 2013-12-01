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

require 'spec_helper'

describe History do
  pending "add some examples to (or delete) #{__FILE__}"
end
