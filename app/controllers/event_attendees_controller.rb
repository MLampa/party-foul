class EventAttendeesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @event_attendee = EventAttendee.create(user: current_user, event: @event)
    if @event_attendee.save
      flash.notice = "You are attending #{@event.event_name}"
      redirect_to events_path
    else
      flash.notice = @event.errors.full_messages.join(". ")
      redirect_to events_path
    end
  end

end
