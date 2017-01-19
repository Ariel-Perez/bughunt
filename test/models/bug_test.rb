# == Schema Information
#
# Table name: bugs
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :text
#  priority    :integer          default("0")
#  resolved    :boolean          default("f")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  score       :integer          default("0")
#

require 'test_helper'

class BugTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
