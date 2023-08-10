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
	has_many :members, dependent: :delete_all 
	has_many :tasks, dependent: :delete_all
	has_many :procedures, dependent: :delete_all

	validates :author, presence: true
	validates :title,  presence: true
end
