# == Schema Information
#
# Table name: project_stages
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :integer          not null
#  stage_id   :integer          not null
#
# Indexes
#
#  index_project_stages_on_project_id  (project_id)
#  index_project_stages_on_stage_id    (stage_id)
#
# Foreign Keys
#
#  project_id  (project_id => projects.id)
#  stage_id    (stage_id => stages.id)
#
class ProjectStage < ApplicationRecord
end
