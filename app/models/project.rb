# == Schema Information
#
# Table name: projects
#
#  id           :integer          not null, primary key
#  position     :integer
#  title        :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  procedure_id :integer          not null
#  stage_id     :integer          not null
#
# Indexes
#
#  index_projects_on_procedure_id  (procedure_id)
#  index_projects_on_stage_id      (stage_id)
#
# Foreign Keys
#
#  procedure_id  (procedure_id => procedures.id)
#  stage_id      (stage_id => stages.id)
#
class Project < ApplicationRecord
	belongs_to :procedure
	belongs_to :stage

	acts_as_list
end
