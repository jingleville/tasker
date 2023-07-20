# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  author     :string
#  body       :text
#  deadline   :datetime
#  status     :text
#  title      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :integer          not null
#
# Indexes
#
#  index_tasks_on_group_id  (group_id)
#
# Foreign Keys
#
#  group_id  (group_id => groups.id)
#
require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
