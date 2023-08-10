# == Schema Information
#
# Table name: procedures
#
#  id         :integer          not null, primary key
#  body       :text
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
class Procedure < ApplicationRecord
	belongs_to :group
	has_many :stages, -> { order(stage_ord: :asc) }, dependent: :delete_all
	has_many :projects, dependent: :delete_all
end
