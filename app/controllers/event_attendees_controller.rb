class EventAttendeesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    EventAttendee.create(user: current_user, event: @event)
    redirect_to events_path
  end
end
