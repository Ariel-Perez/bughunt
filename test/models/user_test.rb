# == Schema Information
#
# Table name: users
#
#  id                    :integer          not null, primary key
#  username              :string
#  name                  :string
#  email                 :string
#  password              :string
#  password_confirmation :string
#  password_digest       :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  score                 :integer          default("0")
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
