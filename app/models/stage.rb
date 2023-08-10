# == Schema Information
#
# Table name: stages
#
#  id           :integer          not null, primary key
#  body         :text
#  color        :string
#  stage_ord    :integer
#  title        :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  procedure_id :integer          not null
#
# Indexes
#
#  index_stages_on_procedure_id  (procedure_id)
#
# Foreign Keys
#
#  procedure_id  (procedure_id => procedures.id)
#
class Stage < ApplicationRecord
	belongs_to :procedure
	has_many :projects, dependent: :delete_all
	has_many :responsible_people, dependent: :delete_all

	validates :procedure_id, uniqueness: { scope: :stage_ord,
    	message: "this order number isn't available" }


  def next
    procedure.stages.where("stage_ord > ?", order).first
  end

  def prev
    procedure.stages.where("stage_ord < ?", order).last
  end
end

