class Votes < ActiveRecord::Base
  belongs_to :event_attendees
  belongs_to :users, through: :event_attendees

  validates :event_id, presence: true
  validates :user_id, presence: true

  validates :vote_id, uniqueness: {
    scope: :user_id,
    message: "already voted"
  }
end
