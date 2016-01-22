class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_type, null: false
      t.string :event_name, null: false
      t.text :description, null: false
      t.string :venue_name
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip_code, null: false
      t.date :event_date, null: false
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.timestamps null: false
    end
  end
end
