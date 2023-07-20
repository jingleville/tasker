# == Schema Information
#
# Table name: members
#
#  id         :integer          not null, primary key
#  role       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_members_on_group_id  (group_id)
#  index_members_on_user_id   (user_id)
#
# Foreign Keys
#
#  group_id  (group_id => groups.id)
#  user_id   (user_id => users.id)
#
require "test_helper"

class MemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
