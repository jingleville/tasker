# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  author     :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Group < ApplicationRecord
	has_many :members
	has_many :tasks

	validates :author, presence: true
	validates :title,  presence: true
end
