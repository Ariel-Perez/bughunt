# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  bug_id     :integer
#  score      :integer
#  event_type :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Event < ApplicationRecord
  belongs_to :user
  belongs_to :bug, optional: true

  inheritance_column = nil

  enum event_type: [:created, :resolved, :confirmed, :steps, :tagged, :joined]

  def text
    case event_type
    when "created"
      "#{user.username} has created the bug: #{bug.name}"
    when "resolved"
      "#{user.username} has resolved the bug: #{bug.name}"
    when "confirmed"
      "#{user.username} has confirmed the bug: #{bug.name}"
    when "steps"
      "#{user.username} has added reproduction steps for the bug: #{bug.name}"
    when "tagged"
      "#{user.username} has set tags for the bug: #{bug.name}"
    when "joined"
      "#{user.username} has joined the community!"
    end
  end
end
