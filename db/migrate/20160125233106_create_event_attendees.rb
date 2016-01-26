class CreateEventAttendees < ActiveRecord::Migration
  def change
    create_join_table :users, :events, table_name: :event_attendees
  end
end
