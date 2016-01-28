class EventAttendeesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @event_attendee = EventAttendee.new
    @event_attendee.user = current_user
    @event_attendee.event = @event
    binding.pry
    if @event_attendee.save
      flash[:notice] = "You are attending #{@event.event_name}"
      redirect_to event_path(@event_attendee.event)
    else
      flash.notice = @event.errors.full_messages.join(". ")
      redirect_to event_path(@event_attendee.event)
    end
  end

  def destroy
    @event_attendee = EventAttendee.find(params[:id])
    @event_attendee.destroy
    flash[:notice] = "You are no longer attending this event"
    redirect_to event_path(@event_attendee.event)
  end
end
