class EventAttendee < ActiveRecord::Base
 belongs_to :event
 belongs_to :user

 validates :id, presence: true
 validates :user_id, presence: true, uniqueness: { scope: :event_id }
   validates :event_id, presence: true
end
