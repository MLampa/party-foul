class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.users
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      flash.notice = "Your event has been added successfully"
      redirect_to events_path
    else
      flash.notice = @event.errors.full_messages.join(". ")
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    if @event.save
      flash.notice = "Your event has been added successfully"
      redirect_to event_path(@event)
    else flash.notice = @event.errors.full_messages.join(". ")
      render "edit"
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  def welcome
    render "home"
  end

  private

  def event_params
    params.require(:event).permit(
      :event_type,
      :event_name,
      :description,
      :venue_name,
      :address,
      :city,
      :state,
      :zip_code,
      :event_start,
      :event_end
    )
  end
end
