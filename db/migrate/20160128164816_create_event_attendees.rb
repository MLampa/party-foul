class CreateEventAttendees < ActiveRecord::Migration
  def change
    create_table :event_attendees do |t|
      t.integer :user_id, null: false
      t.integer :event_id, null: false
    end
  end
end
