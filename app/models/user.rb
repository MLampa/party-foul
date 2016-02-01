require_relative '../uploaders/avatar_uploader.rb'

class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true, uniqueness: true
  has_many :events
  has_many :event_attendees
  has_many :events, through: :event_attendees
  has_many :votes, through: :event_attendees
end
