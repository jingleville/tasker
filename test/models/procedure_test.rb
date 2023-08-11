# == Schema Information
#
# Table name: procedures
#
#  id         :integer          not null, primary key
#  title      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :integer          not null
#
# Indexes
#
#  index_procedures_on_group_id  (group_id)
#
# Foreign Keys
#
#  group_id  (group_id => groups.id)
#
require "test_helper"

class ProcedureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
