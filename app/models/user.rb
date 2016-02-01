class User < ActiveRecord::Base
  has_many :events
  has_many :event_attendees
  has_many :events, through: :event_attendees
  has_many :votes, through: :event_attendees

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true, uniqueness: true

end
