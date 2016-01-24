class CreateEventOrganizers < ActiveRecord::Migration
  def change
    create_join_table :users, :events, table_name: :event_organizers
  end
end
