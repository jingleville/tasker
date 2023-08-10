# == Schema Information
#
# Table name: responsible_people
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  stage_id   :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_responsible_people_on_stage_id  (stage_id)
#  index_responsible_people_on_user_id   (user_id)
#
# Foreign Keys
#
#  stage_id  (stage_id => stages.id)
#  user_id   (user_id => users.id)
#
class ResponsiblePerson < ApplicationRecord
	belongs_to :stage
	belongs_to :user

	validates :user_id, uniqueness: { scope: :stage_id,
    	message: "this order number isn't available" }
end
