# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  author     :string
#  body       :text
#  deadline   :datetime
#  status     :text
#  title      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :integer          not null
#
# Indexes
#
#  index_tasks_on_group_id  (group_id)
#
# Foreign Keys
#
#  group_id  (group_id => groups.id)
#
class Task < ApplicationRecord
  belongs_to :group

  validates :author,    presence: true
  validates :body,      presence: true
  validates :deadline,  presence: true
  validates :status,    presence: true  
  validates :title,     presence: true  

  validate :deadline_cannot_be_in_the_past

  def deadline_cannot_be_in_the_past
    if deadline.present? && deadline < DateTime.now
      errors.add(:deadline, "can't be in the past")
    end
  end   

end
