class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
     t.integer :event_attendee_id, null: false
     t.integer :user_id, null: false
     t.text :comments
     t.boolean :up, default: false, null: false
     t.timestamps
   end

   add_column :event_attendees, :revup_count, :integer, default: 0, null: false
   add_column :event_attendees, :revdown_count, :integer, default: 0, null: false

   add_index :votes, [:event_attendee_id, :user_id], unique: true
  end

end
