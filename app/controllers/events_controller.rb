class EventsController < ApplicationController

  before_action :set_event, only: [:show, :edit, :update, :destroy, :subscribe]
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
      flash.now[:success] = "Success"
      redirect_to current_user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      flash.now[:success] = "Edit with success !"
    else
      render 'edit'
    end
  end

  def show
  end

  def subscribe
    @event.attendees << current_user
    redirect_to root_path
  end

  def destroy
    @event.destroy
    redirect_to current_user
  end

  private
  def event_params
    params.require(:event).permit(:description, :date, :place, :creator_id)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
