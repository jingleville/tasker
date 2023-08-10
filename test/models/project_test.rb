# == Schema Information
#
# Table name: projects
#
#  id           :integer          not null, primary key
#  body         :text
#  title        :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  procedure_id :integer          not null
#  stage_id     :integer
#
# Indexes
#
#  index_projects_on_procedure_id  (procedure_id)
#
# Foreign Keys
#
#  procedure_id  (procedure_id => procedures.id)
#
require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
