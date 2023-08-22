# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  archived   :boolean
#  author     :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Group < ApplicationRecord
	has_many :members, dependent: :destroy 
	has_many :procedures, dependent: :destroy

	validates :author, presence: true
	validates :title,  presence: true
end
