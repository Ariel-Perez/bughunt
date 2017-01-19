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

class Bug < ApplicationRecord
  has_and_belongs_to_many :tags
  has_many :events

  def self.top(n)
    where(resolved: false).order(score: :desc).limit(n)
  end

  def self.unsolved
    where(resolved: false)
  end
end
