class ChangeEventAttendees < ActiveRecord::Migration
  def change
    add_column :event_attendees, :id, :primary_key
  end
end
