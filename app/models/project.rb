# == Schema Information
#
# Table name: projects
#
#  id           :integer          not null, primary key
#  position     :integer          default(1), not null
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
class Project < ApplicationRecord
	belongs_to :procedure
	belongs_to :stage

	acts_as_list

	validates :position, uniqueness: { scope: :procedure}
end
