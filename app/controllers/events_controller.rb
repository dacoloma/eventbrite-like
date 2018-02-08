class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    @event.creator = current_user
    if @event.save
      flash[:success] = "Success"
      redirect_to current_user
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def subscribe
    @event = Event.find(params[:id])
    @event.attendees << current_user
    redirect_to root_path
  end

  private
  def event_params
    params.require(:event).permit(:description, :date, :place, :creator_id)
  end
end
