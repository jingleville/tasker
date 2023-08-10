# == Schema Information
#
# Table name: responsiple_people
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  stage_id   :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_responsiple_people_on_stage_id  (stage_id)
#  index_responsiple_people_on_user_id   (user_id)
#
# Foreign Keys
#
#  stage_id  (stage_id => stages.id)
#  user_id   (user_id => users.id)
#
require "test_helper"

class ResponsiplePersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
