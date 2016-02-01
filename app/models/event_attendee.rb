class EventAttendee < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_many :votes

  validates :user_id, presence: true, uniqueness: { scope: :event_id }
  validates :event_id, presence: true
end
