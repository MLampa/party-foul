class VotesController < ActionController::Base
  before_action :authenticate_user!, except: [:index, :show]

  def update
    @event = Event.find(params[:event_id])
    @event_attendee = EventAttendee.find(params[:id])
    vote = Vote.find_by(user: current_user, event_attendee: @event_attendee)
    if vote
      if vote.up
        if params[:up] == "true"
          vote.destroy
          @event_attendee.revup_count -= 1
        elsif params[:down] == "true"
          vote.destroy
          vote = @event_attendee.votes.new(user: current_user)
          vote.up = false
          @event_attendee.revup_count -= 1
          @event_attendee.revdown_count += 1
        end
      else
        if params[:up] == "true"
          vote.destroy
          vote = @event_attendee.votes.new(user: current_user)
          vote.up = true
          @event_attendee.revup_count += 1
          @event_attendee.revdown_count -= 1
        elsif params[:down] == "true"
          vote.destroy
          @event_attendee.revdown_count -= 1
        end
      end
    else
      vote = @event_attendee.votes.new(user: current_user, up: false)
      if params[:up] == "true"
        @event_attendee.revup_count += 1
        vote.up = true
      elsif params[:down] == "true"
        @event_attendee.revdown_count += 1
      end
    end
    if vote.save && @event_attendee.save
      flash[:notice] = "You have voted!"
      if params[:load_javascript] == "false"
        redirect_to event_path(@event), method: "get"
      else
        render(json: @event_attendee.to_json)
      end
    else
      flash[:notice] = vote.errors.full_messages.join(". ")
      if params[:load_javascript] == "false"
        redirect_to event_path(@event)
      else
        render(json: @event_attendee.to_json)
      end
    end
  end
end
