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

class User < ApplicationRecord
  has_secure_password

  has_many :events

  def self.leaderboard
    order(score: :desc).limit(5)
  end
end
