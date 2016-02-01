class EventAttendeesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def create
    @event = Event.find(params[:event_id])
    @event_attendee = EventAttendee.new
    @event_attendee.user = current_user
    @event_attendee.event = @event

    if @event_attendee.save
      flash[:notice] = "You are attending #{@event.event_name}"
      redirect_to event_path(@event_attendee.event)
    else
      flash.notice = @event_attendee.errors.full_messages.join(". ")
      redirect_to event_path(@event_attendee.event)
    end
  end

  def destroy
    @event_attendee = EventAttendee.find(params[:id])
    @event_attendee.destroy
    flash[:notice] = "You are no longer attending this event"
    redirect_to event_path(@event_attendee.event)
  end

  def update
    @event_attendee = EventAttendee.find(params[:id])
    if params["up"]
      count = @event_attendee.revup_count + 1
      @event_attendee.update(revup_count: count)
    elsif params["down"]
      count = @event_attendee.revdown_count + 1
      @event_attendee.update(revdown_count: count)
    end
    redirect_to event_path(params[:event])
  end

  private

  def vote_params
    params.require(:event_attendee).permit(
      :vote,
      :comment
    )
  end
end
