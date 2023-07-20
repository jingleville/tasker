# == Schema Information
#
# Table name: admins
#
#  id                     :integer          not null, primary key
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string           default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_admins_on_reset_password_token  (reset_password_token) UNIQUE
#  index_admins_on_username              (username) UNIQUE
#
require "test_helper"

class AdminTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
